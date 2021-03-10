$EventConsumerToCleanup = Get-WmiObject -Namespace root/subscription -Class CommandLineEventConsumer -Filter "Name = 'WMIper'"
$EventFilterToCleanup = Get-WmiObject -Namespace root/subscription -Class __EventFilter -Filter "Name = 'WMIper'"
$FilterConsumerBindingToCleanup = Get-WmiObject -Namespace root/subscription -Query "REFERENCES OF {$($EventConsumerToCleanup.__RELPATH)} WHERE ResultClass = __FilterToConsumerBinding" -ErrorAction SilentlyContinue
$FilterConsumerBindingToCleanup | Remove-WmiObject
$EventConsumerToCleanup | Remove-WmiObject
$EventFilterToCleanup | Remove-WmiObject