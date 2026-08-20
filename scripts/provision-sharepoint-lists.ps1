param(
    [Parameter(Mandatory = $false)]
    [string]$RequestListName = "Client Requests",

    [Parameter(Mandatory = $false)]
    [string]$CategoryListName = "Request Categories",

    [Parameter(Mandatory = $false)]
    [string]$ActivityLogListName = "Request Activity Log"
)

$ErrorActionPreference = "Stop"

function Ensure-List {
    param(
        [string]$Title,
        [string]$Template = "GenericList"
    )

    $existingList = Get-PnPList -Identity $Title -ErrorAction SilentlyContinue

    if (-not $existingList) {
        New-PnPList -Title $Title -Template $Template -OnQuickLaunch | Out-Null
        Write-Host "Created list: $Title"
    }
    else {
        Write-Host "List already exists: $Title"
    }
}

function Ensure-Field {
    param(
        [string]$List,
        [string]$DisplayName,
        [string]$InternalName,
        [string]$Type,
        [string[]]$Choices
    )

    $field = Get-PnPField -List $List -Identity $InternalName -ErrorAction SilentlyContinue

    if (-not $field) {
        if ($Type -eq "Choice") {
            Add-PnPField -List $List `
                -DisplayName $DisplayName `
                -InternalName $InternalName `
                -Type Choice `
                -Choices $Choices | Out-Null
        }
        else {
            Add-PnPField -List $List `
                -DisplayName $DisplayName `
                -InternalName $InternalName `
                -Type $Type | Out-Null
        }

        Write-Host "Created field: $DisplayName"
    }
    else {
        Write-Host "Field already exists: $DisplayName"
    }
}

Ensure-List -Title $RequestListName
Ensure-List -Title $CategoryListName
Ensure-List -Title $ActivityLogListName

Ensure-Field -List $RequestListName -DisplayName "Request ID" -InternalName "RequestId" -Type Text
Ensure-Field -List $RequestListName -DisplayName "Request Type" -InternalName "RequestType" -Type Choice `
    -Choices @("Equipment", "Maintenance", "Access", "Service", "Other")
Ensure-Field -List $RequestListName -DisplayName "Priority" -InternalName "Priority" -Type Choice `
    -Choices @("Low", "Medium", "High", "Critical")
Ensure-Field -List $RequestListName -DisplayName "Location" -InternalName "Location" -Type Text
Ensure-Field -List $RequestListName -DisplayName "Related Asset ID" -InternalName "RelatedAssetId" -Type Text
Ensure-Field -List $RequestListName -DisplayName "Need By Date" -InternalName "NeedByDate" -Type DateTime
Ensure-Field -List $RequestListName -DisplayName "Estimated Cost" -InternalName "EstimatedCost" -Type Currency
Ensure-Field -List $RequestListName -DisplayName "Business Justification" -InternalName "BusinessJustification" -Type Note
Ensure-Field -List $RequestListName -DisplayName "Status" -InternalName "Status" -Type Choice `
    -Choices @("Draft", "Submitted", "Pending Approval", "Approved", "Rejected", "Assigned", "In Progress", "Completed")
Ensure-Field -List $RequestListName -DisplayName "Correlation ID" -InternalName "CorrelationId" -Type Text

Ensure-Field -List $CategoryListName -DisplayName "SLA Hours" -InternalName "SLAHours" -Type Number
Ensure-Field -List $CategoryListName -DisplayName "Cost Approval Threshold" -InternalName "CostApprovalThreshold" -Type Currency
Ensure-Field -List $CategoryListName -DisplayName "Active" -InternalName "Active" -Type Boolean

Ensure-Field -List $ActivityLogListName -DisplayName "Request ID" -InternalName "RequestId" -Type Text
Ensure-Field -List $ActivityLogListName -DisplayName "Event Type" -InternalName "EventType" -Type Text
Ensure-Field -List $ActivityLogListName -DisplayName "Details" -InternalName "Details" -Type Note
Ensure-Field -List $ActivityLogListName -DisplayName "Occurred On" -InternalName "OccurredOn" -Type DateTime
Ensure-Field -List $ActivityLogListName -DisplayName "Correlation ID" -InternalName "CorrelationId" -Type Text

Write-Host "Client Request Hub list provisioning completed."