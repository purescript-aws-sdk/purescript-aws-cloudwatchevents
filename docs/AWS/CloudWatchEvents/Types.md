## Module AWS.CloudWatchEvents.Types

#### `options`

``` purescript
options :: Options
```

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


