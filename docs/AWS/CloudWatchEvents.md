## Module AWS.CloudWatchEvents

<p>Amazon CloudWatch Events helps you to respond to state changes in your AWS resources. When your resources change state, they automatically send events into an event stream. You can create rules that match selected events in the stream and route them to targets to take action. You can also use rules to take action on a pre-determined schedule. For example, you can configure rules to:</p> <ul> <li> <p>Automatically invoke an AWS Lambda function to update DNS entries when an event notifies you that Amazon EC2 instance enters the running state.</p> </li> <li> <p>Direct specific API records from CloudTrail to an Amazon Kinesis stream for detailed analysis of potential security or availability risks.</p> </li> <li> <p>Periodically invoke a built-in target to create a snapshot of an Amazon EBS volume.</p> </li> </ul> <p>For more information about the features of Amazon CloudWatch Events, see the <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/events">Amazon CloudWatch Events User Guide</a>.</p>

#### `deleteRule`

``` purescript
deleteRule :: forall eff. DeleteRuleRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Deletes the specified rule.</p> <p>You must remove all targets from a rule using <a>RemoveTargets</a> before you can delete the rule.</p> <p>When you delete a rule, incoming events might continue to match to the deleted rule. Please allow a short period of time for changes to take effect.</p>

#### `describeEventBus`

``` purescript
describeEventBus :: forall eff. DescribeEventBusRequest -> Aff (exception :: EXCEPTION | eff) DescribeEventBusResponse
```

<p>Displays the external AWS accounts that are permitted to write events to your account using your account's event bus, and the associated policy. To enable your account to receive events from other accounts, use <a>PutPermission</a>.</p>

#### `describeRule`

``` purescript
describeRule :: forall eff. DescribeRuleRequest -> Aff (exception :: EXCEPTION | eff) DescribeRuleResponse
```

<p>Describes the specified rule.</p>

#### `disableRule`

``` purescript
disableRule :: forall eff. DisableRuleRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Disables the specified rule. A disabled rule won't match any events, and won't self-trigger if it has a schedule expression.</p> <p>When you disable a rule, incoming events might continue to match to the disabled rule. Please allow a short period of time for changes to take effect.</p>

#### `enableRule`

``` purescript
enableRule :: forall eff. EnableRuleRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Enables the specified rule. If the rule does not exist, the operation fails.</p> <p>When you enable a rule, incoming events might not immediately start matching to a newly enabled rule. Please allow a short period of time for changes to take effect.</p>

#### `listRuleNamesByTarget`

``` purescript
listRuleNamesByTarget :: forall eff. ListRuleNamesByTargetRequest -> Aff (exception :: EXCEPTION | eff) ListRuleNamesByTargetResponse
```

<p>Lists the rules for the specified target. You can see which of the rules in Amazon CloudWatch Events can invoke a specific target in your account.</p>

#### `listRules`

``` purescript
listRules :: forall eff. ListRulesRequest -> Aff (exception :: EXCEPTION | eff) ListRulesResponse
```

<p>Lists your Amazon CloudWatch Events rules. You can either list all the rules or you can provide a prefix to match to the rule names.</p>

#### `listTargetsByRule`

``` purescript
listTargetsByRule :: forall eff. ListTargetsByRuleRequest -> Aff (exception :: EXCEPTION | eff) ListTargetsByRuleResponse
```

<p>Lists the targets assigned to the specified rule.</p>

#### `putEvents`

``` purescript
putEvents :: forall eff. PutEventsRequest -> Aff (exception :: EXCEPTION | eff) PutEventsResponse
```

<p>Sends custom events to Amazon CloudWatch Events so that they can be matched to rules.</p>

#### `putPermission`

``` purescript
putPermission :: forall eff. PutPermissionRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Running <code>PutPermission</code> permits the specified AWS account to put events to your account's default <i>event bus</i>. CloudWatch Events rules in your account are triggered by these events arriving to your default event bus. </p> <p>For another account to send events to your account, that external account must have a CloudWatch Events rule with your account's default event bus as a target.</p> <p>To enable multiple AWS accounts to put events to your default event bus, run <code>PutPermission</code> once for each of these accounts.</p> <p>The permission policy on the default event bus cannot exceed 10KB in size.</p>

#### `putRule`

``` purescript
putRule :: forall eff. PutRuleRequest -> Aff (exception :: EXCEPTION | eff) PutRuleResponse
```

<p>Creates or updates the specified rule. Rules are enabled by default, or based on value of the state. You can disable a rule using <a>DisableRule</a>.</p> <p>If you are updating an existing rule, the rule is completely replaced with what you specify in this <code>PutRule</code> command. If you omit arguments in <code>PutRule</code>, the old values for those arguments are not kept. Instead, they are replaced with null values.</p> <p>When you create or update a rule, incoming events might not immediately start matching to new or updated rules. Please allow a short period of time for changes to take effect.</p> <p>A rule must contain at least an EventPattern or ScheduleExpression. Rules with EventPatterns are triggered when a matching event is observed. Rules with ScheduleExpressions self-trigger based on the given schedule. A rule can have both an EventPattern and a ScheduleExpression, in which case the rule triggers on matching events as well as on a schedule.</p> <p>Most services in AWS treat : or / as the same character in Amazon Resource Names (ARNs). However, CloudWatch Events uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.</p>

#### `putTargets`

``` purescript
putTargets :: forall eff. PutTargetsRequest -> Aff (exception :: EXCEPTION | eff) PutTargetsResponse
```

<p>Adds the specified targets to the specified rule, or updates the targets if they are already associated with the rule.</p> <p>Targets are the resources that are invoked when a rule is triggered.</p> <p>You can configure the following as targets for CloudWatch Events:</p> <ul> <li> <p>EC2 instances</p> </li> <li> <p>AWS Lambda functions</p> </li> <li> <p>Streams in Amazon Kinesis Streams</p> </li> <li> <p>Delivery streams in Amazon Kinesis Firehose</p> </li> <li> <p>Amazon ECS tasks</p> </li> <li> <p>AWS Step Functions state machines</p> </li> <li> <p>AWS Batch jobs</p> </li> <li> <p>Pipelines in Amazon Code Pipeline</p> </li> <li> <p>Amazon Inspector assessment templates</p> </li> <li> <p>Amazon SNS topics</p> </li> <li> <p>Amazon SQS queues</p> </li> <li> <p>The default event bus of another AWS account</p> </li> </ul> <p>Note that creating rules with built-in targets is supported only in the AWS Management Console.</p> <p>For some target types, <code>PutTargets</code> provides target-specific parameters. If the target is an Amazon Kinesis stream, you can optionally specify which shard the event goes to by using the <code>KinesisParameters</code> argument. To invoke a command on multiple EC2 instances with one rule, you can use the <code>RunCommandParameters</code> field.</p> <p>To be able to make API calls against the resources that you own, Amazon CloudWatch Events needs the appropriate permissions. For AWS Lambda and Amazon SNS resources, CloudWatch Events relies on resource-based policies. For EC2 instances, Amazon Kinesis streams, and AWS Step Functions state machines, CloudWatch Events relies on IAM roles that you specify in the <code>RoleARN</code> argument in <code>PutTargets</code>. For more information, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/events/auth-and-access-control-cwe.html">Authentication and Access Control</a> in the <i>Amazon CloudWatch Events User Guide</i>.</p> <p>If another AWS account is in the same region and has granted you permission (using <code>PutPermission</code>), you can send events to that account by setting that account's event bus as a target of the rules in your account. To send the matched events to the other account, specify that account's event bus as the <code>Arn</code> when you run <code>PutTargets</code>. If your account sends events to another account, your account is charged for each sent event. Each event sent to antoher account is charged as a custom event. The account receiving the event is not charged. For more information on pricing, see <a href="https://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch Pricing</a>.</p> <p>For more information about enabling cross-account events, see <a>PutPermission</a>.</p> <p> <b>Input</b>, <b>InputPath</b> and <b>InputTransformer</b> are mutually exclusive and optional parameters of a target. When a rule is triggered due to a matched event:</p> <ul> <li> <p>If none of the following arguments are specified for a target, then the entire event is passed to the target in JSON form (unless the target is Amazon EC2 Run Command or Amazon ECS task, in which case nothing from the event is passed to the target).</p> </li> <li> <p>If <b>Input</b> is specified in the form of valid JSON, then the matched event is overridden with this constant.</p> </li> <li> <p>If <b>InputPath</b> is specified in the form of JSONPath (for example, <code>$.detail</code>), then only the part of the event specified in the path is passed to the target (for example, only the detail part of the event is passed).</p> </li> <li> <p>If <b>InputTransformer</b> is specified, then one or more specified JSONPaths are extracted from the event and used as values in a template that you specify as the input to the target.</p> </li> </ul> <p>When you specify <code>InputPath</code> or <code>InputTransformer</code>, you must use JSON dot notation, not bracket notation.</p> <p>When you add targets to a rule and the associated rule triggers soon after, new or updated targets might not be immediately invoked. Please allow a short period of time for changes to take effect.</p> <p>This action can partially fail if too many requests are made at the same time. If that happens, <code>FailedEntryCount</code> is non-zero in the response and each entry in <code>FailedEntries</code> provides the ID of the failed target and the error code.</p>

#### `removePermission`

``` purescript
removePermission :: forall eff. RemovePermissionRequest -> Aff (exception :: EXCEPTION | eff) NoOutput
```

<p>Revokes the permission of another AWS account to be able to put events to your default event bus. Specify the account to revoke by the <code>StatementId</code> value that you associated with the account when you granted it permission with <code>PutPermission</code>. You can find the <code>StatementId</code> by using <a>DescribeEventBus</a>.</p>

#### `removeTargets`

``` purescript
removeTargets :: forall eff. RemoveTargetsRequest -> Aff (exception :: EXCEPTION | eff) RemoveTargetsResponse
```

<p>Removes the specified targets from the specified rule. When the rule is triggered, those targets are no longer be invoked.</p> <p>When you remove a target, when the associated rule triggers, removed targets might continue to be invoked. Please allow a short period of time for changes to take effect.</p> <p>This action can partially fail if too many requests are made at the same time. If that happens, <code>FailedEntryCount</code> is non-zero in the response and each entry in <code>FailedEntries</code> provides the ID of the failed target and the error code.</p>

#### `testEventPattern`

``` purescript
testEventPattern :: forall eff. TestEventPatternRequest -> Aff (exception :: EXCEPTION | eff) TestEventPatternResponse
```

<p>Tests whether the specified event pattern matches the provided event.</p> <p>Most services in AWS treat : or / as the same character in Amazon Resource Names (ARNs). However, CloudWatch Events uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.</p>

#### `Action`

``` purescript
newtype Action
  = Action String
```

##### Instances
``` purescript
Newtype Action _
Generic Action _
Show Action
Decode Action
Encode Action
```

#### `Arn`

``` purescript
newtype Arn
  = Arn String
```

##### Instances
``` purescript
Newtype Arn _
Generic Arn _
Show Arn
Decode Arn
Encode Arn
```

#### `BatchArrayProperties`

``` purescript
newtype BatchArrayProperties
  = BatchArrayProperties { "Size" :: NullOrUndefined (Int) }
```

<p>The array properties for the submitted job, such as the size of the array. The array size can be between 2 and 10,000. If you specify array properties for a job, it becomes an array job. This parameter is used only if the target is an AWS Batch job.</p>

##### Instances
``` purescript
Newtype BatchArrayProperties _
Generic BatchArrayProperties _
Show BatchArrayProperties
Decode BatchArrayProperties
Encode BatchArrayProperties
```

#### `newBatchArrayProperties`

``` purescript
newBatchArrayProperties :: BatchArrayProperties
```

Constructs BatchArrayProperties from required parameters

#### `newBatchArrayProperties'`

``` purescript
newBatchArrayProperties' :: ({ "Size" :: NullOrUndefined (Int) } -> { "Size" :: NullOrUndefined (Int) }) -> BatchArrayProperties
```

Constructs BatchArrayProperties's fields from required parameters

#### `BatchParameters`

``` purescript
newtype BatchParameters
  = BatchParameters { "JobDefinition" :: String, "JobName" :: String, "ArrayProperties" :: NullOrUndefined (BatchArrayProperties), "RetryStrategy" :: NullOrUndefined (BatchRetryStrategy) }
```

<p>The custom parameters to be used when the target is an AWS Batch job.</p>

##### Instances
``` purescript
Newtype BatchParameters _
Generic BatchParameters _
Show BatchParameters
Decode BatchParameters
Encode BatchParameters
```

#### `newBatchParameters`

``` purescript
newBatchParameters :: String -> String -> BatchParameters
```

Constructs BatchParameters from required parameters

#### `newBatchParameters'`

``` purescript
newBatchParameters' :: String -> String -> ({ "JobDefinition" :: String, "JobName" :: String, "ArrayProperties" :: NullOrUndefined (BatchArrayProperties), "RetryStrategy" :: NullOrUndefined (BatchRetryStrategy) } -> { "JobDefinition" :: String, "JobName" :: String, "ArrayProperties" :: NullOrUndefined (BatchArrayProperties), "RetryStrategy" :: NullOrUndefined (BatchRetryStrategy) }) -> BatchParameters
```

Constructs BatchParameters's fields from required parameters

#### `BatchRetryStrategy`

``` purescript
newtype BatchRetryStrategy
  = BatchRetryStrategy { "Attempts" :: NullOrUndefined (Int) }
```

<p>The retry strategy to use for failed jobs, if the target is an AWS Batch job. If you specify a retry strategy here, it overrides the retry strategy defined in the job definition.</p>

##### Instances
``` purescript
Newtype BatchRetryStrategy _
Generic BatchRetryStrategy _
Show BatchRetryStrategy
Decode BatchRetryStrategy
Encode BatchRetryStrategy
```

#### `newBatchRetryStrategy`

``` purescript
newBatchRetryStrategy :: BatchRetryStrategy
```

Constructs BatchRetryStrategy from required parameters

#### `newBatchRetryStrategy'`

``` purescript
newBatchRetryStrategy' :: ({ "Attempts" :: NullOrUndefined (Int) } -> { "Attempts" :: NullOrUndefined (Int) }) -> BatchRetryStrategy
```

Constructs BatchRetryStrategy's fields from required parameters

#### `ConcurrentModificationException`

``` purescript
newtype ConcurrentModificationException
  = ConcurrentModificationException NoArguments
```

<p>There is concurrent modification on a rule or target.</p>

##### Instances
``` purescript
Newtype ConcurrentModificationException _
Generic ConcurrentModificationException _
Show ConcurrentModificationException
Decode ConcurrentModificationException
Encode ConcurrentModificationException
```

#### `DeleteRuleRequest`

``` purescript
newtype DeleteRuleRequest
  = DeleteRuleRequest { "Name" :: RuleName }
```

##### Instances
``` purescript
Newtype DeleteRuleRequest _
Generic DeleteRuleRequest _
Show DeleteRuleRequest
Decode DeleteRuleRequest
Encode DeleteRuleRequest
```

#### `newDeleteRuleRequest`

``` purescript
newDeleteRuleRequest :: RuleName -> DeleteRuleRequest
```

Constructs DeleteRuleRequest from required parameters

#### `newDeleteRuleRequest'`

``` purescript
newDeleteRuleRequest' :: RuleName -> ({ "Name" :: RuleName } -> { "Name" :: RuleName }) -> DeleteRuleRequest
```

Constructs DeleteRuleRequest's fields from required parameters

#### `DescribeEventBusRequest`

``` purescript
newtype DescribeEventBusRequest
  = DescribeEventBusRequest NoArguments
```

##### Instances
``` purescript
Newtype DescribeEventBusRequest _
Generic DescribeEventBusRequest _
Show DescribeEventBusRequest
Decode DescribeEventBusRequest
Encode DescribeEventBusRequest
```

#### `DescribeEventBusResponse`

``` purescript
newtype DescribeEventBusResponse
  = DescribeEventBusResponse { "Name" :: NullOrUndefined (String), "Arn" :: NullOrUndefined (String), "Policy" :: NullOrUndefined (String) }
```

##### Instances
``` purescript
Newtype DescribeEventBusResponse _
Generic DescribeEventBusResponse _
Show DescribeEventBusResponse
Decode DescribeEventBusResponse
Encode DescribeEventBusResponse
```

#### `newDescribeEventBusResponse`

``` purescript
newDescribeEventBusResponse :: DescribeEventBusResponse
```

Constructs DescribeEventBusResponse from required parameters

#### `newDescribeEventBusResponse'`

``` purescript
newDescribeEventBusResponse' :: ({ "Name" :: NullOrUndefined (String), "Arn" :: NullOrUndefined (String), "Policy" :: NullOrUndefined (String) } -> { "Name" :: NullOrUndefined (String), "Arn" :: NullOrUndefined (String), "Policy" :: NullOrUndefined (String) }) -> DescribeEventBusResponse
```

Constructs DescribeEventBusResponse's fields from required parameters

#### `DescribeRuleRequest`

``` purescript
newtype DescribeRuleRequest
  = DescribeRuleRequest { "Name" :: RuleName }
```

##### Instances
``` purescript
Newtype DescribeRuleRequest _
Generic DescribeRuleRequest _
Show DescribeRuleRequest
Decode DescribeRuleRequest
Encode DescribeRuleRequest
```

#### `newDescribeRuleRequest`

``` purescript
newDescribeRuleRequest :: RuleName -> DescribeRuleRequest
```

Constructs DescribeRuleRequest from required parameters

#### `newDescribeRuleRequest'`

``` purescript
newDescribeRuleRequest' :: RuleName -> ({ "Name" :: RuleName } -> { "Name" :: RuleName }) -> DescribeRuleRequest
```

Constructs DescribeRuleRequest's fields from required parameters

#### `DescribeRuleResponse`

``` purescript
newtype DescribeRuleResponse
  = DescribeRuleResponse { "Name" :: NullOrUndefined (RuleName), "Arn" :: NullOrUndefined (RuleArn), "EventPattern" :: NullOrUndefined (EventPattern), "ScheduleExpression" :: NullOrUndefined (ScheduleExpression), "State" :: NullOrUndefined (RuleState), "Description" :: NullOrUndefined (RuleDescription), "RoleArn" :: NullOrUndefined (RoleArn) }
```

##### Instances
``` purescript
Newtype DescribeRuleResponse _
Generic DescribeRuleResponse _
Show DescribeRuleResponse
Decode DescribeRuleResponse
Encode DescribeRuleResponse
```

#### `newDescribeRuleResponse`

``` purescript
newDescribeRuleResponse :: DescribeRuleResponse
```

Constructs DescribeRuleResponse from required parameters

#### `newDescribeRuleResponse'`

``` purescript
newDescribeRuleResponse' :: ({ "Name" :: NullOrUndefined (RuleName), "Arn" :: NullOrUndefined (RuleArn), "EventPattern" :: NullOrUndefined (EventPattern), "ScheduleExpression" :: NullOrUndefined (ScheduleExpression), "State" :: NullOrUndefined (RuleState), "Description" :: NullOrUndefined (RuleDescription), "RoleArn" :: NullOrUndefined (RoleArn) } -> { "Name" :: NullOrUndefined (RuleName), "Arn" :: NullOrUndefined (RuleArn), "EventPattern" :: NullOrUndefined (EventPattern), "ScheduleExpression" :: NullOrUndefined (ScheduleExpression), "State" :: NullOrUndefined (RuleState), "Description" :: NullOrUndefined (RuleDescription), "RoleArn" :: NullOrUndefined (RoleArn) }) -> DescribeRuleResponse
```

Constructs DescribeRuleResponse's fields from required parameters

#### `DisableRuleRequest`

``` purescript
newtype DisableRuleRequest
  = DisableRuleRequest { "Name" :: RuleName }
```

##### Instances
``` purescript
Newtype DisableRuleRequest _
Generic DisableRuleRequest _
Show DisableRuleRequest
Decode DisableRuleRequest
Encode DisableRuleRequest
```

#### `newDisableRuleRequest`

``` purescript
newDisableRuleRequest :: RuleName -> DisableRuleRequest
```

Constructs DisableRuleRequest from required parameters

#### `newDisableRuleRequest'`

``` purescript
newDisableRuleRequest' :: RuleName -> ({ "Name" :: RuleName } -> { "Name" :: RuleName }) -> DisableRuleRequest
```

Constructs DisableRuleRequest's fields from required parameters

#### `EcsParameters`

``` purescript
newtype EcsParameters
  = EcsParameters { "TaskDefinitionArn" :: Arn, "TaskCount" :: NullOrUndefined (LimitMin1) }
```

<p>The custom parameters to be used when the target is an Amazon ECS cluster.</p>

##### Instances
``` purescript
Newtype EcsParameters _
Generic EcsParameters _
Show EcsParameters
Decode EcsParameters
Encode EcsParameters
```

#### `newEcsParameters`

``` purescript
newEcsParameters :: Arn -> EcsParameters
```

Constructs EcsParameters from required parameters

#### `newEcsParameters'`

``` purescript
newEcsParameters' :: Arn -> ({ "TaskDefinitionArn" :: Arn, "TaskCount" :: NullOrUndefined (LimitMin1) } -> { "TaskDefinitionArn" :: Arn, "TaskCount" :: NullOrUndefined (LimitMin1) }) -> EcsParameters
```

Constructs EcsParameters's fields from required parameters

#### `EnableRuleRequest`

``` purescript
newtype EnableRuleRequest
  = EnableRuleRequest { "Name" :: RuleName }
```

##### Instances
``` purescript
Newtype EnableRuleRequest _
Generic EnableRuleRequest _
Show EnableRuleRequest
Decode EnableRuleRequest
Encode EnableRuleRequest
```

#### `newEnableRuleRequest`

``` purescript
newEnableRuleRequest :: RuleName -> EnableRuleRequest
```

Constructs EnableRuleRequest from required parameters

#### `newEnableRuleRequest'`

``` purescript
newEnableRuleRequest' :: RuleName -> ({ "Name" :: RuleName } -> { "Name" :: RuleName }) -> EnableRuleRequest
```

Constructs EnableRuleRequest's fields from required parameters

#### `ErrorCode`

``` purescript
newtype ErrorCode
  = ErrorCode String
```

##### Instances
``` purescript
Newtype ErrorCode _
Generic ErrorCode _
Show ErrorCode
Decode ErrorCode
Encode ErrorCode
```

#### `ErrorMessage`

``` purescript
newtype ErrorMessage
  = ErrorMessage String
```

##### Instances
``` purescript
Newtype ErrorMessage _
Generic ErrorMessage _
Show ErrorMessage
Decode ErrorMessage
Encode ErrorMessage
```

#### `EventId`

``` purescript
newtype EventId
  = EventId String
```

##### Instances
``` purescript
Newtype EventId _
Generic EventId _
Show EventId
Decode EventId
Encode EventId
```

#### `EventPattern`

``` purescript
newtype EventPattern
  = EventPattern String
```

##### Instances
``` purescript
Newtype EventPattern _
Generic EventPattern _
Show EventPattern
Decode EventPattern
Encode EventPattern
```

#### `EventResource`

``` purescript
newtype EventResource
  = EventResource String
```

##### Instances
``` purescript
Newtype EventResource _
Generic EventResource _
Show EventResource
Decode EventResource
Encode EventResource
```

#### `EventResourceList`

``` purescript
newtype EventResourceList
  = EventResourceList (Array EventResource)
```

##### Instances
``` purescript
Newtype EventResourceList _
Generic EventResourceList _
Show EventResourceList
Decode EventResourceList
Encode EventResourceList
```

#### `EventTime`

``` purescript
newtype EventTime
  = EventTime Timestamp
```

##### Instances
``` purescript
Newtype EventTime _
Generic EventTime _
Show EventTime
Decode EventTime
Encode EventTime
```

#### `InputTransformer`

``` purescript
newtype InputTransformer
  = InputTransformer { "InputPathsMap" :: NullOrUndefined (TransformerPaths), "InputTemplate" :: TransformerInput }
```

<p>Contains the parameters needed for you to provide custom input to a target based on one or more pieces of data extracted from the event.</p>

##### Instances
``` purescript
Newtype InputTransformer _
Generic InputTransformer _
Show InputTransformer
Decode InputTransformer
Encode InputTransformer
```

#### `newInputTransformer`

``` purescript
newInputTransformer :: TransformerInput -> InputTransformer
```

Constructs InputTransformer from required parameters

#### `newInputTransformer'`

``` purescript
newInputTransformer' :: TransformerInput -> ({ "InputPathsMap" :: NullOrUndefined (TransformerPaths), "InputTemplate" :: TransformerInput } -> { "InputPathsMap" :: NullOrUndefined (TransformerPaths), "InputTemplate" :: TransformerInput }) -> InputTransformer
```

Constructs InputTransformer's fields from required parameters

#### `InputTransformerPathKey`

``` purescript
newtype InputTransformerPathKey
  = InputTransformerPathKey String
```

##### Instances
``` purescript
Newtype InputTransformerPathKey _
Generic InputTransformerPathKey _
Show InputTransformerPathKey
Decode InputTransformerPathKey
Encode InputTransformerPathKey
```

#### `InternalException`

``` purescript
newtype InternalException
  = InternalException NoArguments
```

<p>This exception occurs due to unexpected causes.</p>

##### Instances
``` purescript
Newtype InternalException _
Generic InternalException _
Show InternalException
Decode InternalException
Encode InternalException
```

#### `InvalidEventPatternException`

``` purescript
newtype InvalidEventPatternException
  = InvalidEventPatternException NoArguments
```

<p>The event pattern is not valid.</p>

##### Instances
``` purescript
Newtype InvalidEventPatternException _
Generic InvalidEventPatternException _
Show InvalidEventPatternException
Decode InvalidEventPatternException
Encode InvalidEventPatternException
```

#### `KinesisParameters`

``` purescript
newtype KinesisParameters
  = KinesisParameters { "PartitionKeyPath" :: TargetPartitionKeyPath }
```

<p>This object enables you to specify a JSON path to extract from the event and use as the partition key for the Amazon Kinesis stream, so that you can control the shard to which the event goes. If you do not include this parameter, the default is to use the <code>eventId</code> as the partition key.</p>

##### Instances
``` purescript
Newtype KinesisParameters _
Generic KinesisParameters _
Show KinesisParameters
Decode KinesisParameters
Encode KinesisParameters
```

#### `newKinesisParameters`

``` purescript
newKinesisParameters :: TargetPartitionKeyPath -> KinesisParameters
```

Constructs KinesisParameters from required parameters

#### `newKinesisParameters'`

``` purescript
newKinesisParameters' :: TargetPartitionKeyPath -> ({ "PartitionKeyPath" :: TargetPartitionKeyPath } -> { "PartitionKeyPath" :: TargetPartitionKeyPath }) -> KinesisParameters
```

Constructs KinesisParameters's fields from required parameters

#### `LimitExceededException`

``` purescript
newtype LimitExceededException
  = LimitExceededException NoArguments
```

<p>You tried to create more rules or add more targets to a rule than is allowed.</p>

##### Instances
``` purescript
Newtype LimitExceededException _
Generic LimitExceededException _
Show LimitExceededException
Decode LimitExceededException
Encode LimitExceededException
```

#### `LimitMax100`

``` purescript
newtype LimitMax100
  = LimitMax100 Int
```

##### Instances
``` purescript
Newtype LimitMax100 _
Generic LimitMax100 _
Show LimitMax100
Decode LimitMax100
Encode LimitMax100
```

#### `LimitMin1`

``` purescript
newtype LimitMin1
  = LimitMin1 Int
```

##### Instances
``` purescript
Newtype LimitMin1 _
Generic LimitMin1 _
Show LimitMin1
Decode LimitMin1
Encode LimitMin1
```

#### `ListRuleNamesByTargetRequest`

``` purescript
newtype ListRuleNamesByTargetRequest
  = ListRuleNamesByTargetRequest { "TargetArn" :: TargetArn, "NextToken" :: NullOrUndefined (NextToken), "Limit" :: NullOrUndefined (LimitMax100) }
```

##### Instances
``` purescript
Newtype ListRuleNamesByTargetRequest _
Generic ListRuleNamesByTargetRequest _
Show ListRuleNamesByTargetRequest
Decode ListRuleNamesByTargetRequest
Encode ListRuleNamesByTargetRequest
```

#### `newListRuleNamesByTargetRequest`

``` purescript
newListRuleNamesByTargetRequest :: TargetArn -> ListRuleNamesByTargetRequest
```

Constructs ListRuleNamesByTargetRequest from required parameters

#### `newListRuleNamesByTargetRequest'`

``` purescript
newListRuleNamesByTargetRequest' :: TargetArn -> ({ "TargetArn" :: TargetArn, "NextToken" :: NullOrUndefined (NextToken), "Limit" :: NullOrUndefined (LimitMax100) } -> { "TargetArn" :: TargetArn, "NextToken" :: NullOrUndefined (NextToken), "Limit" :: NullOrUndefined (LimitMax100) }) -> ListRuleNamesByTargetRequest
```

Constructs ListRuleNamesByTargetRequest's fields from required parameters

#### `ListRuleNamesByTargetResponse`

``` purescript
newtype ListRuleNamesByTargetResponse
  = ListRuleNamesByTargetResponse { "RuleNames" :: NullOrUndefined (RuleNameList), "NextToken" :: NullOrUndefined (NextToken) }
```

##### Instances
``` purescript
Newtype ListRuleNamesByTargetResponse _
Generic ListRuleNamesByTargetResponse _
Show ListRuleNamesByTargetResponse
Decode ListRuleNamesByTargetResponse
Encode ListRuleNamesByTargetResponse
```

#### `newListRuleNamesByTargetResponse`

``` purescript
newListRuleNamesByTargetResponse :: ListRuleNamesByTargetResponse
```

Constructs ListRuleNamesByTargetResponse from required parameters

#### `newListRuleNamesByTargetResponse'`

``` purescript
newListRuleNamesByTargetResponse' :: ({ "RuleNames" :: NullOrUndefined (RuleNameList), "NextToken" :: NullOrUndefined (NextToken) } -> { "RuleNames" :: NullOrUndefined (RuleNameList), "NextToken" :: NullOrUndefined (NextToken) }) -> ListRuleNamesByTargetResponse
```

Constructs ListRuleNamesByTargetResponse's fields from required parameters

#### `ListRulesRequest`

``` purescript
newtype ListRulesRequest
  = ListRulesRequest { "NamePrefix" :: NullOrUndefined (RuleName), "NextToken" :: NullOrUndefined (NextToken), "Limit" :: NullOrUndefined (LimitMax100) }
```

##### Instances
``` purescript
Newtype ListRulesRequest _
Generic ListRulesRequest _
Show ListRulesRequest
Decode ListRulesRequest
Encode ListRulesRequest
```

#### `newListRulesRequest`

``` purescript
newListRulesRequest :: ListRulesRequest
```

Constructs ListRulesRequest from required parameters

#### `newListRulesRequest'`

``` purescript
newListRulesRequest' :: ({ "NamePrefix" :: NullOrUndefined (RuleName), "NextToken" :: NullOrUndefined (NextToken), "Limit" :: NullOrUndefined (LimitMax100) } -> { "NamePrefix" :: NullOrUndefined (RuleName), "NextToken" :: NullOrUndefined (NextToken), "Limit" :: NullOrUndefined (LimitMax100) }) -> ListRulesRequest
```

Constructs ListRulesRequest's fields from required parameters

#### `ListRulesResponse`

``` purescript
newtype ListRulesResponse
  = ListRulesResponse { "Rules" :: NullOrUndefined (RuleResponseList), "NextToken" :: NullOrUndefined (NextToken) }
```

##### Instances
``` purescript
Newtype ListRulesResponse _
Generic ListRulesResponse _
Show ListRulesResponse
Decode ListRulesResponse
Encode ListRulesResponse
```

#### `newListRulesResponse`

``` purescript
newListRulesResponse :: ListRulesResponse
```

Constructs ListRulesResponse from required parameters

#### `newListRulesResponse'`

``` purescript
newListRulesResponse' :: ({ "Rules" :: NullOrUndefined (RuleResponseList), "NextToken" :: NullOrUndefined (NextToken) } -> { "Rules" :: NullOrUndefined (RuleResponseList), "NextToken" :: NullOrUndefined (NextToken) }) -> ListRulesResponse
```

Constructs ListRulesResponse's fields from required parameters

#### `ListTargetsByRuleRequest`

``` purescript
newtype ListTargetsByRuleRequest
  = ListTargetsByRuleRequest { "Rule" :: RuleName, "NextToken" :: NullOrUndefined (NextToken), "Limit" :: NullOrUndefined (LimitMax100) }
```

##### Instances
``` purescript
Newtype ListTargetsByRuleRequest _
Generic ListTargetsByRuleRequest _
Show ListTargetsByRuleRequest
Decode ListTargetsByRuleRequest
Encode ListTargetsByRuleRequest
```

#### `newListTargetsByRuleRequest`

``` purescript
newListTargetsByRuleRequest :: RuleName -> ListTargetsByRuleRequest
```

Constructs ListTargetsByRuleRequest from required parameters

#### `newListTargetsByRuleRequest'`

``` purescript
newListTargetsByRuleRequest' :: RuleName -> ({ "Rule" :: RuleName, "NextToken" :: NullOrUndefined (NextToken), "Limit" :: NullOrUndefined (LimitMax100) } -> { "Rule" :: RuleName, "NextToken" :: NullOrUndefined (NextToken), "Limit" :: NullOrUndefined (LimitMax100) }) -> ListTargetsByRuleRequest
```

Constructs ListTargetsByRuleRequest's fields from required parameters

#### `ListTargetsByRuleResponse`

``` purescript
newtype ListTargetsByRuleResponse
  = ListTargetsByRuleResponse { "Targets" :: NullOrUndefined (TargetList), "NextToken" :: NullOrUndefined (NextToken) }
```

##### Instances
``` purescript
Newtype ListTargetsByRuleResponse _
Generic ListTargetsByRuleResponse _
Show ListTargetsByRuleResponse
Decode ListTargetsByRuleResponse
Encode ListTargetsByRuleResponse
```

#### `newListTargetsByRuleResponse`

``` purescript
newListTargetsByRuleResponse :: ListTargetsByRuleResponse
```

Constructs ListTargetsByRuleResponse from required parameters

#### `newListTargetsByRuleResponse'`

``` purescript
newListTargetsByRuleResponse' :: ({ "Targets" :: NullOrUndefined (TargetList), "NextToken" :: NullOrUndefined (NextToken) } -> { "Targets" :: NullOrUndefined (TargetList), "NextToken" :: NullOrUndefined (NextToken) }) -> ListTargetsByRuleResponse
```

Constructs ListTargetsByRuleResponse's fields from required parameters

#### `NextToken`

``` purescript
newtype NextToken
  = NextToken String
```

##### Instances
``` purescript
Newtype NextToken _
Generic NextToken _
Show NextToken
Decode NextToken
Encode NextToken
```

#### `PolicyLengthExceededException`

``` purescript
newtype PolicyLengthExceededException
  = PolicyLengthExceededException NoArguments
```

<p>The event bus policy is too long. For more information, see the limits.</p>

##### Instances
``` purescript
Newtype PolicyLengthExceededException _
Generic PolicyLengthExceededException _
Show PolicyLengthExceededException
Decode PolicyLengthExceededException
Encode PolicyLengthExceededException
```

#### `Principal`

``` purescript
newtype Principal
  = Principal String
```

##### Instances
``` purescript
Newtype Principal _
Generic Principal _
Show Principal
Decode Principal
Encode Principal
```

#### `PutEventsRequest`

``` purescript
newtype PutEventsRequest
  = PutEventsRequest { "Entries" :: PutEventsRequestEntryList }
```

##### Instances
``` purescript
Newtype PutEventsRequest _
Generic PutEventsRequest _
Show PutEventsRequest
Decode PutEventsRequest
Encode PutEventsRequest
```

#### `newPutEventsRequest`

``` purescript
newPutEventsRequest :: PutEventsRequestEntryList -> PutEventsRequest
```

Constructs PutEventsRequest from required parameters

#### `newPutEventsRequest'`

``` purescript
newPutEventsRequest' :: PutEventsRequestEntryList -> ({ "Entries" :: PutEventsRequestEntryList } -> { "Entries" :: PutEventsRequestEntryList }) -> PutEventsRequest
```

Constructs PutEventsRequest's fields from required parameters

#### `PutEventsRequestEntry`

``` purescript
newtype PutEventsRequestEntry
  = PutEventsRequestEntry { "Time" :: NullOrUndefined (EventTime), "Source" :: NullOrUndefined (String), "Resources" :: NullOrUndefined (EventResourceList), "DetailType" :: NullOrUndefined (String), "Detail" :: NullOrUndefined (String) }
```

<p>Represents an event to be submitted.</p>

##### Instances
``` purescript
Newtype PutEventsRequestEntry _
Generic PutEventsRequestEntry _
Show PutEventsRequestEntry
Decode PutEventsRequestEntry
Encode PutEventsRequestEntry
```

#### `newPutEventsRequestEntry`

``` purescript
newPutEventsRequestEntry :: PutEventsRequestEntry
```

Constructs PutEventsRequestEntry from required parameters

#### `newPutEventsRequestEntry'`

``` purescript
newPutEventsRequestEntry' :: ({ "Time" :: NullOrUndefined (EventTime), "Source" :: NullOrUndefined (String), "Resources" :: NullOrUndefined (EventResourceList), "DetailType" :: NullOrUndefined (String), "Detail" :: NullOrUndefined (String) } -> { "Time" :: NullOrUndefined (EventTime), "Source" :: NullOrUndefined (String), "Resources" :: NullOrUndefined (EventResourceList), "DetailType" :: NullOrUndefined (String), "Detail" :: NullOrUndefined (String) }) -> PutEventsRequestEntry
```

Constructs PutEventsRequestEntry's fields from required parameters

#### `PutEventsRequestEntryList`

``` purescript
newtype PutEventsRequestEntryList
  = PutEventsRequestEntryList (Array PutEventsRequestEntry)
```

##### Instances
``` purescript
Newtype PutEventsRequestEntryList _
Generic PutEventsRequestEntryList _
Show PutEventsRequestEntryList
Decode PutEventsRequestEntryList
Encode PutEventsRequestEntryList
```

#### `PutEventsResponse`

``` purescript
newtype PutEventsResponse
  = PutEventsResponse { "FailedEntryCount" :: NullOrUndefined (Int), "Entries" :: NullOrUndefined (PutEventsResultEntryList) }
```

##### Instances
``` purescript
Newtype PutEventsResponse _
Generic PutEventsResponse _
Show PutEventsResponse
Decode PutEventsResponse
Encode PutEventsResponse
```

#### `newPutEventsResponse`

``` purescript
newPutEventsResponse :: PutEventsResponse
```

Constructs PutEventsResponse from required parameters

#### `newPutEventsResponse'`

``` purescript
newPutEventsResponse' :: ({ "FailedEntryCount" :: NullOrUndefined (Int), "Entries" :: NullOrUndefined (PutEventsResultEntryList) } -> { "FailedEntryCount" :: NullOrUndefined (Int), "Entries" :: NullOrUndefined (PutEventsResultEntryList) }) -> PutEventsResponse
```

Constructs PutEventsResponse's fields from required parameters

#### `PutEventsResultEntry`

``` purescript
newtype PutEventsResultEntry
  = PutEventsResultEntry { "EventId" :: NullOrUndefined (EventId), "ErrorCode" :: NullOrUndefined (ErrorCode), "ErrorMessage" :: NullOrUndefined (ErrorMessage) }
```

<p>Represents an event that failed to be submitted.</p>

##### Instances
``` purescript
Newtype PutEventsResultEntry _
Generic PutEventsResultEntry _
Show PutEventsResultEntry
Decode PutEventsResultEntry
Encode PutEventsResultEntry
```

#### `newPutEventsResultEntry`

``` purescript
newPutEventsResultEntry :: PutEventsResultEntry
```

Constructs PutEventsResultEntry from required parameters

#### `newPutEventsResultEntry'`

``` purescript
newPutEventsResultEntry' :: ({ "EventId" :: NullOrUndefined (EventId), "ErrorCode" :: NullOrUndefined (ErrorCode), "ErrorMessage" :: NullOrUndefined (ErrorMessage) } -> { "EventId" :: NullOrUndefined (EventId), "ErrorCode" :: NullOrUndefined (ErrorCode), "ErrorMessage" :: NullOrUndefined (ErrorMessage) }) -> PutEventsResultEntry
```

Constructs PutEventsResultEntry's fields from required parameters

#### `PutEventsResultEntryList`

``` purescript
newtype PutEventsResultEntryList
  = PutEventsResultEntryList (Array PutEventsResultEntry)
```

##### Instances
``` purescript
Newtype PutEventsResultEntryList _
Generic PutEventsResultEntryList _
Show PutEventsResultEntryList
Decode PutEventsResultEntryList
Encode PutEventsResultEntryList
```

#### `PutPermissionRequest`

``` purescript
newtype PutPermissionRequest
  = PutPermissionRequest { "Action" :: Action, "Principal" :: Principal, "StatementId" :: StatementId }
```

##### Instances
``` purescript
Newtype PutPermissionRequest _
Generic PutPermissionRequest _
Show PutPermissionRequest
Decode PutPermissionRequest
Encode PutPermissionRequest
```

#### `newPutPermissionRequest`

``` purescript
newPutPermissionRequest :: Action -> Principal -> StatementId -> PutPermissionRequest
```

Constructs PutPermissionRequest from required parameters

#### `newPutPermissionRequest'`

``` purescript
newPutPermissionRequest' :: Action -> Principal -> StatementId -> ({ "Action" :: Action, "Principal" :: Principal, "StatementId" :: StatementId } -> { "Action" :: Action, "Principal" :: Principal, "StatementId" :: StatementId }) -> PutPermissionRequest
```

Constructs PutPermissionRequest's fields from required parameters

#### `PutRuleRequest`

``` purescript
newtype PutRuleRequest
  = PutRuleRequest { "Name" :: RuleName, "ScheduleExpression" :: NullOrUndefined (ScheduleExpression), "EventPattern" :: NullOrUndefined (EventPattern), "State" :: NullOrUndefined (RuleState), "Description" :: NullOrUndefined (RuleDescription), "RoleArn" :: NullOrUndefined (RoleArn) }
```

##### Instances
``` purescript
Newtype PutRuleRequest _
Generic PutRuleRequest _
Show PutRuleRequest
Decode PutRuleRequest
Encode PutRuleRequest
```

#### `newPutRuleRequest`

``` purescript
newPutRuleRequest :: RuleName -> PutRuleRequest
```

Constructs PutRuleRequest from required parameters

#### `newPutRuleRequest'`

``` purescript
newPutRuleRequest' :: RuleName -> ({ "Name" :: RuleName, "ScheduleExpression" :: NullOrUndefined (ScheduleExpression), "EventPattern" :: NullOrUndefined (EventPattern), "State" :: NullOrUndefined (RuleState), "Description" :: NullOrUndefined (RuleDescription), "RoleArn" :: NullOrUndefined (RoleArn) } -> { "Name" :: RuleName, "ScheduleExpression" :: NullOrUndefined (ScheduleExpression), "EventPattern" :: NullOrUndefined (EventPattern), "State" :: NullOrUndefined (RuleState), "Description" :: NullOrUndefined (RuleDescription), "RoleArn" :: NullOrUndefined (RoleArn) }) -> PutRuleRequest
```

Constructs PutRuleRequest's fields from required parameters

#### `PutRuleResponse`

``` purescript
newtype PutRuleResponse
  = PutRuleResponse { "RuleArn" :: NullOrUndefined (RuleArn) }
```

##### Instances
``` purescript
Newtype PutRuleResponse _
Generic PutRuleResponse _
Show PutRuleResponse
Decode PutRuleResponse
Encode PutRuleResponse
```

#### `newPutRuleResponse`

``` purescript
newPutRuleResponse :: PutRuleResponse
```

Constructs PutRuleResponse from required parameters

#### `newPutRuleResponse'`

``` purescript
newPutRuleResponse' :: ({ "RuleArn" :: NullOrUndefined (RuleArn) } -> { "RuleArn" :: NullOrUndefined (RuleArn) }) -> PutRuleResponse
```

Constructs PutRuleResponse's fields from required parameters

#### `PutTargetsRequest`

``` purescript
newtype PutTargetsRequest
  = PutTargetsRequest { "Rule" :: RuleName, "Targets" :: TargetList }
```

##### Instances
``` purescript
Newtype PutTargetsRequest _
Generic PutTargetsRequest _
Show PutTargetsRequest
Decode PutTargetsRequest
Encode PutTargetsRequest
```

#### `newPutTargetsRequest`

``` purescript
newPutTargetsRequest :: RuleName -> TargetList -> PutTargetsRequest
```

Constructs PutTargetsRequest from required parameters

#### `newPutTargetsRequest'`

``` purescript
newPutTargetsRequest' :: RuleName -> TargetList -> ({ "Rule" :: RuleName, "Targets" :: TargetList } -> { "Rule" :: RuleName, "Targets" :: TargetList }) -> PutTargetsRequest
```

Constructs PutTargetsRequest's fields from required parameters

#### `PutTargetsResponse`

``` purescript
newtype PutTargetsResponse
  = PutTargetsResponse { "FailedEntryCount" :: NullOrUndefined (Int), "FailedEntries" :: NullOrUndefined (PutTargetsResultEntryList) }
```

##### Instances
``` purescript
Newtype PutTargetsResponse _
Generic PutTargetsResponse _
Show PutTargetsResponse
Decode PutTargetsResponse
Encode PutTargetsResponse
```

#### `newPutTargetsResponse`

``` purescript
newPutTargetsResponse :: PutTargetsResponse
```

Constructs PutTargetsResponse from required parameters

#### `newPutTargetsResponse'`

``` purescript
newPutTargetsResponse' :: ({ "FailedEntryCount" :: NullOrUndefined (Int), "FailedEntries" :: NullOrUndefined (PutTargetsResultEntryList) } -> { "FailedEntryCount" :: NullOrUndefined (Int), "FailedEntries" :: NullOrUndefined (PutTargetsResultEntryList) }) -> PutTargetsResponse
```

Constructs PutTargetsResponse's fields from required parameters

#### `PutTargetsResultEntry`

``` purescript
newtype PutTargetsResultEntry
  = PutTargetsResultEntry { "TargetId" :: NullOrUndefined (TargetId), "ErrorCode" :: NullOrUndefined (ErrorCode), "ErrorMessage" :: NullOrUndefined (ErrorMessage) }
```

<p>Represents a target that failed to be added to a rule.</p>

##### Instances
``` purescript
Newtype PutTargetsResultEntry _
Generic PutTargetsResultEntry _
Show PutTargetsResultEntry
Decode PutTargetsResultEntry
Encode PutTargetsResultEntry
```

#### `newPutTargetsResultEntry`

``` purescript
newPutTargetsResultEntry :: PutTargetsResultEntry
```

Constructs PutTargetsResultEntry from required parameters

#### `newPutTargetsResultEntry'`

``` purescript
newPutTargetsResultEntry' :: ({ "TargetId" :: NullOrUndefined (TargetId), "ErrorCode" :: NullOrUndefined (ErrorCode), "ErrorMessage" :: NullOrUndefined (ErrorMessage) } -> { "TargetId" :: NullOrUndefined (TargetId), "ErrorCode" :: NullOrUndefined (ErrorCode), "ErrorMessage" :: NullOrUndefined (ErrorMessage) }) -> PutTargetsResultEntry
```

Constructs PutTargetsResultEntry's fields from required parameters

#### `PutTargetsResultEntryList`

``` purescript
newtype PutTargetsResultEntryList
  = PutTargetsResultEntryList (Array PutTargetsResultEntry)
```

##### Instances
``` purescript
Newtype PutTargetsResultEntryList _
Generic PutTargetsResultEntryList _
Show PutTargetsResultEntryList
Decode PutTargetsResultEntryList
Encode PutTargetsResultEntryList
```

#### `RemovePermissionRequest`

``` purescript
newtype RemovePermissionRequest
  = RemovePermissionRequest { "StatementId" :: StatementId }
```

##### Instances
``` purescript
Newtype RemovePermissionRequest _
Generic RemovePermissionRequest _
Show RemovePermissionRequest
Decode RemovePermissionRequest
Encode RemovePermissionRequest
```

#### `newRemovePermissionRequest`

``` purescript
newRemovePermissionRequest :: StatementId -> RemovePermissionRequest
```

Constructs RemovePermissionRequest from required parameters

#### `newRemovePermissionRequest'`

``` purescript
newRemovePermissionRequest' :: StatementId -> ({ "StatementId" :: StatementId } -> { "StatementId" :: StatementId }) -> RemovePermissionRequest
```

Constructs RemovePermissionRequest's fields from required parameters

#### `RemoveTargetsRequest`

``` purescript
newtype RemoveTargetsRequest
  = RemoveTargetsRequest { "Rule" :: RuleName, "Ids" :: TargetIdList }
```

##### Instances
``` purescript
Newtype RemoveTargetsRequest _
Generic RemoveTargetsRequest _
Show RemoveTargetsRequest
Decode RemoveTargetsRequest
Encode RemoveTargetsRequest
```

#### `newRemoveTargetsRequest`

``` purescript
newRemoveTargetsRequest :: TargetIdList -> RuleName -> RemoveTargetsRequest
```

Constructs RemoveTargetsRequest from required parameters

#### `newRemoveTargetsRequest'`

``` purescript
newRemoveTargetsRequest' :: TargetIdList -> RuleName -> ({ "Rule" :: RuleName, "Ids" :: TargetIdList } -> { "Rule" :: RuleName, "Ids" :: TargetIdList }) -> RemoveTargetsRequest
```

Constructs RemoveTargetsRequest's fields from required parameters

#### `RemoveTargetsResponse`

``` purescript
newtype RemoveTargetsResponse
  = RemoveTargetsResponse { "FailedEntryCount" :: NullOrUndefined (Int), "FailedEntries" :: NullOrUndefined (RemoveTargetsResultEntryList) }
```

##### Instances
``` purescript
Newtype RemoveTargetsResponse _
Generic RemoveTargetsResponse _
Show RemoveTargetsResponse
Decode RemoveTargetsResponse
Encode RemoveTargetsResponse
```

#### `newRemoveTargetsResponse`

``` purescript
newRemoveTargetsResponse :: RemoveTargetsResponse
```

Constructs RemoveTargetsResponse from required parameters

#### `newRemoveTargetsResponse'`

``` purescript
newRemoveTargetsResponse' :: ({ "FailedEntryCount" :: NullOrUndefined (Int), "FailedEntries" :: NullOrUndefined (RemoveTargetsResultEntryList) } -> { "FailedEntryCount" :: NullOrUndefined (Int), "FailedEntries" :: NullOrUndefined (RemoveTargetsResultEntryList) }) -> RemoveTargetsResponse
```

Constructs RemoveTargetsResponse's fields from required parameters

#### `RemoveTargetsResultEntry`

``` purescript
newtype RemoveTargetsResultEntry
  = RemoveTargetsResultEntry { "TargetId" :: NullOrUndefined (TargetId), "ErrorCode" :: NullOrUndefined (ErrorCode), "ErrorMessage" :: NullOrUndefined (ErrorMessage) }
```

<p>Represents a target that failed to be removed from a rule.</p>

##### Instances
``` purescript
Newtype RemoveTargetsResultEntry _
Generic RemoveTargetsResultEntry _
Show RemoveTargetsResultEntry
Decode RemoveTargetsResultEntry
Encode RemoveTargetsResultEntry
```

#### `newRemoveTargetsResultEntry`

``` purescript
newRemoveTargetsResultEntry :: RemoveTargetsResultEntry
```

Constructs RemoveTargetsResultEntry from required parameters

#### `newRemoveTargetsResultEntry'`

``` purescript
newRemoveTargetsResultEntry' :: ({ "TargetId" :: NullOrUndefined (TargetId), "ErrorCode" :: NullOrUndefined (ErrorCode), "ErrorMessage" :: NullOrUndefined (ErrorMessage) } -> { "TargetId" :: NullOrUndefined (TargetId), "ErrorCode" :: NullOrUndefined (ErrorCode), "ErrorMessage" :: NullOrUndefined (ErrorMessage) }) -> RemoveTargetsResultEntry
```

Constructs RemoveTargetsResultEntry's fields from required parameters

#### `RemoveTargetsResultEntryList`

``` purescript
newtype RemoveTargetsResultEntryList
  = RemoveTargetsResultEntryList (Array RemoveTargetsResultEntry)
```

##### Instances
``` purescript
Newtype RemoveTargetsResultEntryList _
Generic RemoveTargetsResultEntryList _
Show RemoveTargetsResultEntryList
Decode RemoveTargetsResultEntryList
Encode RemoveTargetsResultEntryList
```

#### `ResourceNotFoundException`

``` purescript
newtype ResourceNotFoundException
  = ResourceNotFoundException NoArguments
```

<p>An entity that you specified does not exist.</p>

##### Instances
``` purescript
Newtype ResourceNotFoundException _
Generic ResourceNotFoundException _
Show ResourceNotFoundException
Decode ResourceNotFoundException
Encode ResourceNotFoundException
```

#### `RoleArn`

``` purescript
newtype RoleArn
  = RoleArn String
```

##### Instances
``` purescript
Newtype RoleArn _
Generic RoleArn _
Show RoleArn
Decode RoleArn
Encode RoleArn
```

#### `Rule`

``` purescript
newtype Rule
  = Rule { "Name" :: NullOrUndefined (RuleName), "Arn" :: NullOrUndefined (RuleArn), "EventPattern" :: NullOrUndefined (EventPattern), "State" :: NullOrUndefined (RuleState), "Description" :: NullOrUndefined (RuleDescription), "ScheduleExpression" :: NullOrUndefined (ScheduleExpression), "RoleArn" :: NullOrUndefined (RoleArn) }
```

<p>Contains information about a rule in Amazon CloudWatch Events.</p>

##### Instances
``` purescript
Newtype Rule _
Generic Rule _
Show Rule
Decode Rule
Encode Rule
```

#### `newRule`

``` purescript
newRule :: Rule
```

Constructs Rule from required parameters

#### `newRule'`

``` purescript
newRule' :: ({ "Name" :: NullOrUndefined (RuleName), "Arn" :: NullOrUndefined (RuleArn), "EventPattern" :: NullOrUndefined (EventPattern), "State" :: NullOrUndefined (RuleState), "Description" :: NullOrUndefined (RuleDescription), "ScheduleExpression" :: NullOrUndefined (ScheduleExpression), "RoleArn" :: NullOrUndefined (RoleArn) } -> { "Name" :: NullOrUndefined (RuleName), "Arn" :: NullOrUndefined (RuleArn), "EventPattern" :: NullOrUndefined (EventPattern), "State" :: NullOrUndefined (RuleState), "Description" :: NullOrUndefined (RuleDescription), "ScheduleExpression" :: NullOrUndefined (ScheduleExpression), "RoleArn" :: NullOrUndefined (RoleArn) }) -> Rule
```

Constructs Rule's fields from required parameters

#### `RuleArn`

``` purescript
newtype RuleArn
  = RuleArn String
```

##### Instances
``` purescript
Newtype RuleArn _
Generic RuleArn _
Show RuleArn
Decode RuleArn
Encode RuleArn
```

#### `RuleDescription`

``` purescript
newtype RuleDescription
  = RuleDescription String
```

##### Instances
``` purescript
Newtype RuleDescription _
Generic RuleDescription _
Show RuleDescription
Decode RuleDescription
Encode RuleDescription
```

#### `RuleName`

``` purescript
newtype RuleName
  = RuleName String
```

##### Instances
``` purescript
Newtype RuleName _
Generic RuleName _
Show RuleName
Decode RuleName
Encode RuleName
```

#### `RuleNameList`

``` purescript
newtype RuleNameList
  = RuleNameList (Array RuleName)
```

##### Instances
``` purescript
Newtype RuleNameList _
Generic RuleNameList _
Show RuleNameList
Decode RuleNameList
Encode RuleNameList
```

#### `RuleResponseList`

``` purescript
newtype RuleResponseList
  = RuleResponseList (Array Rule)
```

##### Instances
``` purescript
Newtype RuleResponseList _
Generic RuleResponseList _
Show RuleResponseList
Decode RuleResponseList
Encode RuleResponseList
```

#### `RuleState`

``` purescript
newtype RuleState
  = RuleState String
```

##### Instances
``` purescript
Newtype RuleState _
Generic RuleState _
Show RuleState
Decode RuleState
Encode RuleState
```

#### `RunCommandParameters`

``` purescript
newtype RunCommandParameters
  = RunCommandParameters { "RunCommandTargets" :: RunCommandTargets }
```

<p>This parameter contains the criteria (either InstanceIds or a tag) used to specify which EC2 instances are to be sent the command. </p>

##### Instances
``` purescript
Newtype RunCommandParameters _
Generic RunCommandParameters _
Show RunCommandParameters
Decode RunCommandParameters
Encode RunCommandParameters
```

#### `newRunCommandParameters`

``` purescript
newRunCommandParameters :: RunCommandTargets -> RunCommandParameters
```

Constructs RunCommandParameters from required parameters

#### `newRunCommandParameters'`

``` purescript
newRunCommandParameters' :: RunCommandTargets -> ({ "RunCommandTargets" :: RunCommandTargets } -> { "RunCommandTargets" :: RunCommandTargets }) -> RunCommandParameters
```

Constructs RunCommandParameters's fields from required parameters

#### `RunCommandTarget`

``` purescript
newtype RunCommandTarget
  = RunCommandTarget { "Key" :: RunCommandTargetKey, "Values" :: RunCommandTargetValues }
```

<p>Information about the EC2 instances that are to be sent the command, specified as key-value pairs. Each <code>RunCommandTarget</code> block can include only one key, but this key may specify multiple values.</p>

##### Instances
``` purescript
Newtype RunCommandTarget _
Generic RunCommandTarget _
Show RunCommandTarget
Decode RunCommandTarget
Encode RunCommandTarget
```

#### `newRunCommandTarget`

``` purescript
newRunCommandTarget :: RunCommandTargetKey -> RunCommandTargetValues -> RunCommandTarget
```

Constructs RunCommandTarget from required parameters

#### `newRunCommandTarget'`

``` purescript
newRunCommandTarget' :: RunCommandTargetKey -> RunCommandTargetValues -> ({ "Key" :: RunCommandTargetKey, "Values" :: RunCommandTargetValues } -> { "Key" :: RunCommandTargetKey, "Values" :: RunCommandTargetValues }) -> RunCommandTarget
```

Constructs RunCommandTarget's fields from required parameters

#### `RunCommandTargetKey`

``` purescript
newtype RunCommandTargetKey
  = RunCommandTargetKey String
```

##### Instances
``` purescript
Newtype RunCommandTargetKey _
Generic RunCommandTargetKey _
Show RunCommandTargetKey
Decode RunCommandTargetKey
Encode RunCommandTargetKey
```

#### `RunCommandTargetValue`

``` purescript
newtype RunCommandTargetValue
  = RunCommandTargetValue String
```

##### Instances
``` purescript
Newtype RunCommandTargetValue _
Generic RunCommandTargetValue _
Show RunCommandTargetValue
Decode RunCommandTargetValue
Encode RunCommandTargetValue
```

#### `RunCommandTargetValues`

``` purescript
newtype RunCommandTargetValues
  = RunCommandTargetValues (Array RunCommandTargetValue)
```

##### Instances
``` purescript
Newtype RunCommandTargetValues _
Generic RunCommandTargetValues _
Show RunCommandTargetValues
Decode RunCommandTargetValues
Encode RunCommandTargetValues
```

#### `RunCommandTargets`

``` purescript
newtype RunCommandTargets
  = RunCommandTargets (Array RunCommandTarget)
```

##### Instances
``` purescript
Newtype RunCommandTargets _
Generic RunCommandTargets _
Show RunCommandTargets
Decode RunCommandTargets
Encode RunCommandTargets
```

#### `ScheduleExpression`

``` purescript
newtype ScheduleExpression
  = ScheduleExpression String
```

##### Instances
``` purescript
Newtype ScheduleExpression _
Generic ScheduleExpression _
Show ScheduleExpression
Decode ScheduleExpression
Encode ScheduleExpression
```

#### `StatementId`

``` purescript
newtype StatementId
  = StatementId String
```

##### Instances
``` purescript
Newtype StatementId _
Generic StatementId _
Show StatementId
Decode StatementId
Encode StatementId
```

#### `Target`

``` purescript
newtype Target
  = Target { "Id" :: TargetId, "Arn" :: TargetArn, "RoleArn" :: NullOrUndefined (RoleArn), "Input" :: NullOrUndefined (TargetInput), "InputPath" :: NullOrUndefined (TargetInputPath), "InputTransformer" :: NullOrUndefined (InputTransformer), "KinesisParameters" :: NullOrUndefined (KinesisParameters), "RunCommandParameters" :: NullOrUndefined (RunCommandParameters), "EcsParameters" :: NullOrUndefined (EcsParameters), "BatchParameters" :: NullOrUndefined (BatchParameters) }
```

<p>Targets are the resources to be invoked when a rule is triggered. Target types include EC2 instances, AWS Lambda functions, Amazon Kinesis streams, Amazon ECS tasks, AWS Step Functions state machines, Run Command, and built-in targets.</p>

##### Instances
``` purescript
Newtype Target _
Generic Target _
Show Target
Decode Target
Encode Target
```

#### `newTarget`

``` purescript
newTarget :: TargetArn -> TargetId -> Target
```

Constructs Target from required parameters

#### `newTarget'`

``` purescript
newTarget' :: TargetArn -> TargetId -> ({ "Id" :: TargetId, "Arn" :: TargetArn, "RoleArn" :: NullOrUndefined (RoleArn), "Input" :: NullOrUndefined (TargetInput), "InputPath" :: NullOrUndefined (TargetInputPath), "InputTransformer" :: NullOrUndefined (InputTransformer), "KinesisParameters" :: NullOrUndefined (KinesisParameters), "RunCommandParameters" :: NullOrUndefined (RunCommandParameters), "EcsParameters" :: NullOrUndefined (EcsParameters), "BatchParameters" :: NullOrUndefined (BatchParameters) } -> { "Id" :: TargetId, "Arn" :: TargetArn, "RoleArn" :: NullOrUndefined (RoleArn), "Input" :: NullOrUndefined (TargetInput), "InputPath" :: NullOrUndefined (TargetInputPath), "InputTransformer" :: NullOrUndefined (InputTransformer), "KinesisParameters" :: NullOrUndefined (KinesisParameters), "RunCommandParameters" :: NullOrUndefined (RunCommandParameters), "EcsParameters" :: NullOrUndefined (EcsParameters), "BatchParameters" :: NullOrUndefined (BatchParameters) }) -> Target
```

Constructs Target's fields from required parameters

#### `TargetArn`

``` purescript
newtype TargetArn
  = TargetArn String
```

##### Instances
``` purescript
Newtype TargetArn _
Generic TargetArn _
Show TargetArn
Decode TargetArn
Encode TargetArn
```

#### `TargetId`

``` purescript
newtype TargetId
  = TargetId String
```

##### Instances
``` purescript
Newtype TargetId _
Generic TargetId _
Show TargetId
Decode TargetId
Encode TargetId
```

#### `TargetIdList`

``` purescript
newtype TargetIdList
  = TargetIdList (Array TargetId)
```

##### Instances
``` purescript
Newtype TargetIdList _
Generic TargetIdList _
Show TargetIdList
Decode TargetIdList
Encode TargetIdList
```

#### `TargetInput`

``` purescript
newtype TargetInput
  = TargetInput String
```

##### Instances
``` purescript
Newtype TargetInput _
Generic TargetInput _
Show TargetInput
Decode TargetInput
Encode TargetInput
```

#### `TargetInputPath`

``` purescript
newtype TargetInputPath
  = TargetInputPath String
```

##### Instances
``` purescript
Newtype TargetInputPath _
Generic TargetInputPath _
Show TargetInputPath
Decode TargetInputPath
Encode TargetInputPath
```

#### `TargetList`

``` purescript
newtype TargetList
  = TargetList (Array Target)
```

##### Instances
``` purescript
Newtype TargetList _
Generic TargetList _
Show TargetList
Decode TargetList
Encode TargetList
```

#### `TargetPartitionKeyPath`

``` purescript
newtype TargetPartitionKeyPath
  = TargetPartitionKeyPath String
```

##### Instances
``` purescript
Newtype TargetPartitionKeyPath _
Generic TargetPartitionKeyPath _
Show TargetPartitionKeyPath
Decode TargetPartitionKeyPath
Encode TargetPartitionKeyPath
```

#### `TestEventPatternRequest`

``` purescript
newtype TestEventPatternRequest
  = TestEventPatternRequest { "EventPattern" :: EventPattern, "Event" :: String }
```

##### Instances
``` purescript
Newtype TestEventPatternRequest _
Generic TestEventPatternRequest _
Show TestEventPatternRequest
Decode TestEventPatternRequest
Encode TestEventPatternRequest
```

#### `newTestEventPatternRequest`

``` purescript
newTestEventPatternRequest :: String -> EventPattern -> TestEventPatternRequest
```

Constructs TestEventPatternRequest from required parameters

#### `newTestEventPatternRequest'`

``` purescript
newTestEventPatternRequest' :: String -> EventPattern -> ({ "EventPattern" :: EventPattern, "Event" :: String } -> { "EventPattern" :: EventPattern, "Event" :: String }) -> TestEventPatternRequest
```

Constructs TestEventPatternRequest's fields from required parameters

#### `TestEventPatternResponse`

``` purescript
newtype TestEventPatternResponse
  = TestEventPatternResponse { "Result" :: NullOrUndefined (Boolean) }
```

##### Instances
``` purescript
Newtype TestEventPatternResponse _
Generic TestEventPatternResponse _
Show TestEventPatternResponse
Decode TestEventPatternResponse
Encode TestEventPatternResponse
```

#### `newTestEventPatternResponse`

``` purescript
newTestEventPatternResponse :: TestEventPatternResponse
```

Constructs TestEventPatternResponse from required parameters

#### `newTestEventPatternResponse'`

``` purescript
newTestEventPatternResponse' :: ({ "Result" :: NullOrUndefined (Boolean) } -> { "Result" :: NullOrUndefined (Boolean) }) -> TestEventPatternResponse
```

Constructs TestEventPatternResponse's fields from required parameters

#### `TransformerInput`

``` purescript
newtype TransformerInput
  = TransformerInput String
```

##### Instances
``` purescript
Newtype TransformerInput _
Generic TransformerInput _
Show TransformerInput
Decode TransformerInput
Encode TransformerInput
```

#### `TransformerPaths`

``` purescript
newtype TransformerPaths
  = TransformerPaths (StrMap TargetInputPath)
```

##### Instances
``` purescript
Newtype TransformerPaths _
Generic TransformerPaths _
Show TransformerPaths
Decode TransformerPaths
Encode TransformerPaths
```


