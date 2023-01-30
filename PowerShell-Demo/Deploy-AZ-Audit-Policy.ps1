
# Define the tags that you wish to check for 
$tag1 = "technical-owner"

# Define Policy Definition and Assingment Names/Descriptions
$defName = "Audit Resource Tags"
$defDesc = "Audits all resources to ensure necessary tags are created"
$assignName = "Audit Resource Tags - $tag1"
$assignDesc = "Audits all applicable resources to verify if the tag '$tag1' is present"

# Creates the Policy Definition
$definitions = New-AzPolicyDefinition -Name $defName `
-Description $defDesc `
-Mode Indexed `
-Policy https://raw.githubusercontent.com/prasanpro/Azure.Policy.Demos/master/PowerShell-Demo/AZPolicy-Audit-Tag-Name.json `
-Parameter https://raw.githubusercontent.com/prasanpro/Azure.Policy.Demos/master/PowerShell-Demo/AZPolicy-Audit-Tag-Name-Parameters.json

# Defines the Required resource tags your auditing
$policyParameters = @{tagName1=$tag1}

# Defines the current subscription as the scope for the policy
$sub = "/subscriptions/" + (Get-AzContext).Subscription.Id

# Assigns the policy to the current subscription
New-AzPolicyAssignment -Name $assignName `
-PolicyDefinition $definitions `
-Description $assignDesc `
-Scope $sub `
-PolicyParameterObject $policyParameters




