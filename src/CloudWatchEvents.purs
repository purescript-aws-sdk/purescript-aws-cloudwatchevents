

-- | <p>Amazon CloudWatch Events helps you to respond to state changes in your AWS resources. When your resources change state, they automatically send events into an event stream. You can create rules that match selected events in the stream and route them to targets to take action. You can also use rules to take action on a pre-determined schedule. For example, you can configure rules to:</p> <ul> <li> <p>Automatically invoke an AWS Lambda function to update DNS entries when an event notifies you that Amazon EC2 instance enters the running state.</p> </li> <li> <p>Direct specific API records from CloudTrail to an Amazon Kinesis stream for detailed analysis of potential security or availability risks.</p> </li> <li> <p>Periodically invoke a built-in target to create a snapshot of an Amazon EBS volume.</p> </li> </ul> <p>For more information about the features of Amazon CloudWatch Events, see the <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/events">Amazon CloudWatch Events User Guide</a>.</p>
module AWS.CloudWatchEvents where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Foreign as Foreign
import Data.Foreign.NullOrUndefined (NullOrUndefined(..))
import Data.Foreign.Class (class Decode, class Encode)
import Data.Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Foreign.NullOrUndefined as NullOrUndefined
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.StrMap as StrMap

import AWS.Request as Request
import AWS.Request.Types as Types


-- | <p>Deletes the specified rule.</p> <p>You must remove all targets from a rule using <a>RemoveTargets</a> before you can delete the rule.</p> <p>When you delete a rule, incoming events might continue to match to the deleted rule. Please allow a short period of time for changes to take effect.</p>
deleteRule :: forall eff. DeleteRuleRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
deleteRule = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "deleteRule"


-- | <p>Displays the external AWS accounts that are permitted to write events to your account using your account's event bus, and the associated policy. To enable your account to receive events from other accounts, use <a>PutPermission</a>.</p>
describeEventBus :: forall eff. DescribeEventBusRequest -> Aff (exception :: EXCEPTION | eff) DescribeEventBusResponse
describeEventBus = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "describeEventBus"


-- | <p>Describes the specified rule.</p>
describeRule :: forall eff. DescribeRuleRequest -> Aff (exception :: EXCEPTION | eff) DescribeRuleResponse
describeRule = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "describeRule"


-- | <p>Disables the specified rule. A disabled rule won't match any events, and won't self-trigger if it has a schedule expression.</p> <p>When you disable a rule, incoming events might continue to match to the disabled rule. Please allow a short period of time for changes to take effect.</p>
disableRule :: forall eff. DisableRuleRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
disableRule = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "disableRule"


-- | <p>Enables the specified rule. If the rule does not exist, the operation fails.</p> <p>When you enable a rule, incoming events might not immediately start matching to a newly enabled rule. Please allow a short period of time for changes to take effect.</p>
enableRule :: forall eff. EnableRuleRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
enableRule = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "enableRule"


-- | <p>Lists the rules for the specified target. You can see which of the rules in Amazon CloudWatch Events can invoke a specific target in your account.</p>
listRuleNamesByTarget :: forall eff. ListRuleNamesByTargetRequest -> Aff (exception :: EXCEPTION | eff) ListRuleNamesByTargetResponse
listRuleNamesByTarget = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "listRuleNamesByTarget"


-- | <p>Lists your Amazon CloudWatch Events rules. You can either list all the rules or you can provide a prefix to match to the rule names.</p>
listRules :: forall eff. ListRulesRequest -> Aff (exception :: EXCEPTION | eff) ListRulesResponse
listRules = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "listRules"


-- | <p>Lists the targets assigned to the specified rule.</p>
listTargetsByRule :: forall eff. ListTargetsByRuleRequest -> Aff (exception :: EXCEPTION | eff) ListTargetsByRuleResponse
listTargetsByRule = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "listTargetsByRule"


-- | <p>Sends custom events to Amazon CloudWatch Events so that they can be matched to rules.</p>
putEvents :: forall eff. PutEventsRequest -> Aff (exception :: EXCEPTION | eff) PutEventsResponse
putEvents = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "putEvents"


-- | <p>Running <code>PutPermission</code> permits the specified AWS account to put events to your account's default <i>event bus</i>. CloudWatch Events rules in your account are triggered by these events arriving to your default event bus. </p> <p>For another account to send events to your account, that external account must have a CloudWatch Events rule with your account's default event bus as a target.</p> <p>To enable multiple AWS accounts to put events to your default event bus, run <code>PutPermission</code> once for each of these accounts.</p> <p>The permission policy on the default event bus cannot exceed 10KB in size.</p>
putPermission :: forall eff. PutPermissionRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
putPermission = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "putPermission"


-- | <p>Creates or updates the specified rule. Rules are enabled by default, or based on value of the state. You can disable a rule using <a>DisableRule</a>.</p> <p>If you are updating an existing rule, the rule is completely replaced with what you specify in this <code>PutRule</code> command. If you omit arguments in <code>PutRule</code>, the old values for those arguments are not kept. Instead, they are replaced with null values.</p> <p>When you create or update a rule, incoming events might not immediately start matching to new or updated rules. Please allow a short period of time for changes to take effect.</p> <p>A rule must contain at least an EventPattern or ScheduleExpression. Rules with EventPatterns are triggered when a matching event is observed. Rules with ScheduleExpressions self-trigger based on the given schedule. A rule can have both an EventPattern and a ScheduleExpression, in which case the rule triggers on matching events as well as on a schedule.</p> <p>Most services in AWS treat : or / as the same character in Amazon Resource Names (ARNs). However, CloudWatch Events uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.</p>
putRule :: forall eff. PutRuleRequest -> Aff (exception :: EXCEPTION | eff) PutRuleResponse
putRule = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "putRule"


-- | <p>Adds the specified targets to the specified rule, or updates the targets if they are already associated with the rule.</p> <p>Targets are the resources that are invoked when a rule is triggered.</p> <p>You can configure the following as targets for CloudWatch Events:</p> <ul> <li> <p>EC2 instances</p> </li> <li> <p>AWS Lambda functions</p> </li> <li> <p>Streams in Amazon Kinesis Streams</p> </li> <li> <p>Delivery streams in Amazon Kinesis Firehose</p> </li> <li> <p>Amazon ECS tasks</p> </li> <li> <p>AWS Step Functions state machines</p> </li> <li> <p>AWS Batch jobs</p> </li> <li> <p>Pipelines in Amazon Code Pipeline</p> </li> <li> <p>Amazon Inspector assessment templates</p> </li> <li> <p>Amazon SNS topics</p> </li> <li> <p>Amazon SQS queues</p> </li> <li> <p>The default event bus of another AWS account</p> </li> </ul> <p>Note that creating rules with built-in targets is supported only in the AWS Management Console.</p> <p>For some target types, <code>PutTargets</code> provides target-specific parameters. If the target is an Amazon Kinesis stream, you can optionally specify which shard the event goes to by using the <code>KinesisParameters</code> argument. To invoke a command on multiple EC2 instances with one rule, you can use the <code>RunCommandParameters</code> field.</p> <p>To be able to make API calls against the resources that you own, Amazon CloudWatch Events needs the appropriate permissions. For AWS Lambda and Amazon SNS resources, CloudWatch Events relies on resource-based policies. For EC2 instances, Amazon Kinesis streams, and AWS Step Functions state machines, CloudWatch Events relies on IAM roles that you specify in the <code>RoleARN</code> argument in <code>PutTargets</code>. For more information, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/events/auth-and-access-control-cwe.html">Authentication and Access Control</a> in the <i>Amazon CloudWatch Events User Guide</i>.</p> <p>If another AWS account is in the same region and has granted you permission (using <code>PutPermission</code>), you can send events to that account by setting that account's event bus as a target of the rules in your account. To send the matched events to the other account, specify that account's event bus as the <code>Arn</code> when you run <code>PutTargets</code>. If your account sends events to another account, your account is charged for each sent event. Each event sent to antoher account is charged as a custom event. The account receiving the event is not charged. For more information on pricing, see <a href="https://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch Pricing</a>.</p> <p>For more information about enabling cross-account events, see <a>PutPermission</a>.</p> <p> <b>Input</b>, <b>InputPath</b> and <b>InputTransformer</b> are mutually exclusive and optional parameters of a target. When a rule is triggered due to a matched event:</p> <ul> <li> <p>If none of the following arguments are specified for a target, then the entire event is passed to the target in JSON form (unless the target is Amazon EC2 Run Command or Amazon ECS task, in which case nothing from the event is passed to the target).</p> </li> <li> <p>If <b>Input</b> is specified in the form of valid JSON, then the matched event is overridden with this constant.</p> </li> <li> <p>If <b>InputPath</b> is specified in the form of JSONPath (for example, <code>$.detail</code>), then only the part of the event specified in the path is passed to the target (for example, only the detail part of the event is passed).</p> </li> <li> <p>If <b>InputTransformer</b> is specified, then one or more specified JSONPaths are extracted from the event and used as values in a template that you specify as the input to the target.</p> </li> </ul> <p>When you specify <code>InputPath</code> or <code>InputTransformer</code>, you must use JSON dot notation, not bracket notation.</p> <p>When you add targets to a rule and the associated rule triggers soon after, new or updated targets might not be immediately invoked. Please allow a short period of time for changes to take effect.</p> <p>This action can partially fail if too many requests are made at the same time. If that happens, <code>FailedEntryCount</code> is non-zero in the response and each entry in <code>FailedEntries</code> provides the ID of the failed target and the error code.</p>
putTargets :: forall eff. PutTargetsRequest -> Aff (exception :: EXCEPTION | eff) PutTargetsResponse
putTargets = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "putTargets"


-- | <p>Revokes the permission of another AWS account to be able to put events to your default event bus. Specify the account to revoke by the <code>StatementId</code> value that you associated with the account when you granted it permission with <code>PutPermission</code>. You can find the <code>StatementId</code> by using <a>DescribeEventBus</a>.</p>
removePermission :: forall eff. RemovePermissionRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
removePermission = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "removePermission"


-- | <p>Removes the specified targets from the specified rule. When the rule is triggered, those targets are no longer be invoked.</p> <p>When you remove a target, when the associated rule triggers, removed targets might continue to be invoked. Please allow a short period of time for changes to take effect.</p> <p>This action can partially fail if too many requests are made at the same time. If that happens, <code>FailedEntryCount</code> is non-zero in the response and each entry in <code>FailedEntries</code> provides the ID of the failed target and the error code.</p>
removeTargets :: forall eff. RemoveTargetsRequest -> Aff (exception :: EXCEPTION | eff) RemoveTargetsResponse
removeTargets = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "removeTargets"


-- | <p>Tests whether the specified event pattern matches the provided event.</p> <p>Most services in AWS treat : or / as the same character in Amazon Resource Names (ARNs). However, CloudWatch Events uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.</p>
testEventPattern :: forall eff. TestEventPatternRequest -> Aff (exception :: EXCEPTION | eff) TestEventPatternResponse
testEventPattern = Request.request service method  where
    service = Request.ServiceName "CloudWatchEvents"
    method = Request.MethodName "testEventPattern"


newtype Action = Action String
derive instance newtypeAction :: Newtype Action _
derive instance repGenericAction :: Generic Action _
instance showAction :: Show Action where
  show = genericShow
instance decodeAction :: Decode Action where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeAction :: Encode Action where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype Arn = Arn String
derive instance newtypeArn :: Newtype Arn _
derive instance repGenericArn :: Generic Arn _
instance showArn :: Show Arn where
  show = genericShow
instance decodeArn :: Decode Arn where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeArn :: Encode Arn where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The array properties for the submitted job, such as the size of the array. The array size can be between 2 and 10,000. If you specify array properties for a job, it becomes an array job. This parameter is used only if the target is an AWS Batch job.</p>
newtype BatchArrayProperties = BatchArrayProperties 
  { "Size" :: NullOrUndefined.NullOrUndefined (Int)
  }
derive instance newtypeBatchArrayProperties :: Newtype BatchArrayProperties _
derive instance repGenericBatchArrayProperties :: Generic BatchArrayProperties _
instance showBatchArrayProperties :: Show BatchArrayProperties where
  show = genericShow
instance decodeBatchArrayProperties :: Decode BatchArrayProperties where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeBatchArrayProperties :: Encode BatchArrayProperties where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs BatchArrayProperties from required parameters
newBatchArrayProperties :: BatchArrayProperties
newBatchArrayProperties  = BatchArrayProperties { "Size": (NullOrUndefined Nothing) }

-- | Constructs BatchArrayProperties's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newBatchArrayProperties' :: ( { "Size" :: NullOrUndefined.NullOrUndefined (Int) } -> {"Size" :: NullOrUndefined.NullOrUndefined (Int) } ) -> BatchArrayProperties
newBatchArrayProperties'  customize = (BatchArrayProperties <<< customize) { "Size": (NullOrUndefined Nothing) }



-- | <p>The custom parameters to be used when the target is an AWS Batch job.</p>
newtype BatchParameters = BatchParameters 
  { "JobDefinition" :: (String)
  , "JobName" :: (String)
  , "ArrayProperties" :: NullOrUndefined.NullOrUndefined (BatchArrayProperties)
  , "RetryStrategy" :: NullOrUndefined.NullOrUndefined (BatchRetryStrategy)
  }
derive instance newtypeBatchParameters :: Newtype BatchParameters _
derive instance repGenericBatchParameters :: Generic BatchParameters _
instance showBatchParameters :: Show BatchParameters where
  show = genericShow
instance decodeBatchParameters :: Decode BatchParameters where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeBatchParameters :: Encode BatchParameters where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs BatchParameters from required parameters
newBatchParameters :: String -> String -> BatchParameters
newBatchParameters _JobDefinition _JobName = BatchParameters { "JobDefinition": _JobDefinition, "JobName": _JobName, "ArrayProperties": (NullOrUndefined Nothing), "RetryStrategy": (NullOrUndefined Nothing) }

-- | Constructs BatchParameters's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newBatchParameters' :: String -> String -> ( { "JobDefinition" :: (String) , "JobName" :: (String) , "ArrayProperties" :: NullOrUndefined.NullOrUndefined (BatchArrayProperties) , "RetryStrategy" :: NullOrUndefined.NullOrUndefined (BatchRetryStrategy) } -> {"JobDefinition" :: (String) , "JobName" :: (String) , "ArrayProperties" :: NullOrUndefined.NullOrUndefined (BatchArrayProperties) , "RetryStrategy" :: NullOrUndefined.NullOrUndefined (BatchRetryStrategy) } ) -> BatchParameters
newBatchParameters' _JobDefinition _JobName customize = (BatchParameters <<< customize) { "JobDefinition": _JobDefinition, "JobName": _JobName, "ArrayProperties": (NullOrUndefined Nothing), "RetryStrategy": (NullOrUndefined Nothing) }



-- | <p>The retry strategy to use for failed jobs, if the target is an AWS Batch job. If you specify a retry strategy here, it overrides the retry strategy defined in the job definition.</p>
newtype BatchRetryStrategy = BatchRetryStrategy 
  { "Attempts" :: NullOrUndefined.NullOrUndefined (Int)
  }
derive instance newtypeBatchRetryStrategy :: Newtype BatchRetryStrategy _
derive instance repGenericBatchRetryStrategy :: Generic BatchRetryStrategy _
instance showBatchRetryStrategy :: Show BatchRetryStrategy where
  show = genericShow
instance decodeBatchRetryStrategy :: Decode BatchRetryStrategy where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeBatchRetryStrategy :: Encode BatchRetryStrategy where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs BatchRetryStrategy from required parameters
newBatchRetryStrategy :: BatchRetryStrategy
newBatchRetryStrategy  = BatchRetryStrategy { "Attempts": (NullOrUndefined Nothing) }

-- | Constructs BatchRetryStrategy's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newBatchRetryStrategy' :: ( { "Attempts" :: NullOrUndefined.NullOrUndefined (Int) } -> {"Attempts" :: NullOrUndefined.NullOrUndefined (Int) } ) -> BatchRetryStrategy
newBatchRetryStrategy'  customize = (BatchRetryStrategy <<< customize) { "Attempts": (NullOrUndefined Nothing) }



-- | <p>There is concurrent modification on a rule or target.</p>
newtype ConcurrentModificationException = ConcurrentModificationException Types.NoArguments
derive instance newtypeConcurrentModificationException :: Newtype ConcurrentModificationException _
derive instance repGenericConcurrentModificationException :: Generic ConcurrentModificationException _
instance showConcurrentModificationException :: Show ConcurrentModificationException where
  show = genericShow
instance decodeConcurrentModificationException :: Decode ConcurrentModificationException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeConcurrentModificationException :: Encode ConcurrentModificationException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype DeleteRuleRequest = DeleteRuleRequest 
  { "Name" :: (RuleName)
  }
derive instance newtypeDeleteRuleRequest :: Newtype DeleteRuleRequest _
derive instance repGenericDeleteRuleRequest :: Generic DeleteRuleRequest _
instance showDeleteRuleRequest :: Show DeleteRuleRequest where
  show = genericShow
instance decodeDeleteRuleRequest :: Decode DeleteRuleRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDeleteRuleRequest :: Encode DeleteRuleRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DeleteRuleRequest from required parameters
newDeleteRuleRequest :: RuleName -> DeleteRuleRequest
newDeleteRuleRequest _Name = DeleteRuleRequest { "Name": _Name }

-- | Constructs DeleteRuleRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDeleteRuleRequest' :: RuleName -> ( { "Name" :: (RuleName) } -> {"Name" :: (RuleName) } ) -> DeleteRuleRequest
newDeleteRuleRequest' _Name customize = (DeleteRuleRequest <<< customize) { "Name": _Name }



newtype DescribeEventBusRequest = DescribeEventBusRequest Types.NoArguments
derive instance newtypeDescribeEventBusRequest :: Newtype DescribeEventBusRequest _
derive instance repGenericDescribeEventBusRequest :: Generic DescribeEventBusRequest _
instance showDescribeEventBusRequest :: Show DescribeEventBusRequest where
  show = genericShow
instance decodeDescribeEventBusRequest :: Decode DescribeEventBusRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeEventBusRequest :: Encode DescribeEventBusRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype DescribeEventBusResponse = DescribeEventBusResponse 
  { "Name" :: NullOrUndefined.NullOrUndefined (String)
  , "Arn" :: NullOrUndefined.NullOrUndefined (String)
  , "Policy" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypeDescribeEventBusResponse :: Newtype DescribeEventBusResponse _
derive instance repGenericDescribeEventBusResponse :: Generic DescribeEventBusResponse _
instance showDescribeEventBusResponse :: Show DescribeEventBusResponse where
  show = genericShow
instance decodeDescribeEventBusResponse :: Decode DescribeEventBusResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeEventBusResponse :: Encode DescribeEventBusResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeEventBusResponse from required parameters
newDescribeEventBusResponse :: DescribeEventBusResponse
newDescribeEventBusResponse  = DescribeEventBusResponse { "Arn": (NullOrUndefined Nothing), "Name": (NullOrUndefined Nothing), "Policy": (NullOrUndefined Nothing) }

-- | Constructs DescribeEventBusResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeEventBusResponse' :: ( { "Name" :: NullOrUndefined.NullOrUndefined (String) , "Arn" :: NullOrUndefined.NullOrUndefined (String) , "Policy" :: NullOrUndefined.NullOrUndefined (String) } -> {"Name" :: NullOrUndefined.NullOrUndefined (String) , "Arn" :: NullOrUndefined.NullOrUndefined (String) , "Policy" :: NullOrUndefined.NullOrUndefined (String) } ) -> DescribeEventBusResponse
newDescribeEventBusResponse'  customize = (DescribeEventBusResponse <<< customize) { "Arn": (NullOrUndefined Nothing), "Name": (NullOrUndefined Nothing), "Policy": (NullOrUndefined Nothing) }



newtype DescribeRuleRequest = DescribeRuleRequest 
  { "Name" :: (RuleName)
  }
derive instance newtypeDescribeRuleRequest :: Newtype DescribeRuleRequest _
derive instance repGenericDescribeRuleRequest :: Generic DescribeRuleRequest _
instance showDescribeRuleRequest :: Show DescribeRuleRequest where
  show = genericShow
instance decodeDescribeRuleRequest :: Decode DescribeRuleRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeRuleRequest :: Encode DescribeRuleRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeRuleRequest from required parameters
newDescribeRuleRequest :: RuleName -> DescribeRuleRequest
newDescribeRuleRequest _Name = DescribeRuleRequest { "Name": _Name }

-- | Constructs DescribeRuleRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeRuleRequest' :: RuleName -> ( { "Name" :: (RuleName) } -> {"Name" :: (RuleName) } ) -> DescribeRuleRequest
newDescribeRuleRequest' _Name customize = (DescribeRuleRequest <<< customize) { "Name": _Name }



newtype DescribeRuleResponse = DescribeRuleResponse 
  { "Name" :: NullOrUndefined.NullOrUndefined (RuleName)
  , "Arn" :: NullOrUndefined.NullOrUndefined (RuleArn)
  , "EventPattern" :: NullOrUndefined.NullOrUndefined (EventPattern)
  , "ScheduleExpression" :: NullOrUndefined.NullOrUndefined (ScheduleExpression)
  , "State" :: NullOrUndefined.NullOrUndefined (RuleState)
  , "Description" :: NullOrUndefined.NullOrUndefined (RuleDescription)
  , "RoleArn" :: NullOrUndefined.NullOrUndefined (RoleArn)
  }
derive instance newtypeDescribeRuleResponse :: Newtype DescribeRuleResponse _
derive instance repGenericDescribeRuleResponse :: Generic DescribeRuleResponse _
instance showDescribeRuleResponse :: Show DescribeRuleResponse where
  show = genericShow
instance decodeDescribeRuleResponse :: Decode DescribeRuleResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDescribeRuleResponse :: Encode DescribeRuleResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DescribeRuleResponse from required parameters
newDescribeRuleResponse :: DescribeRuleResponse
newDescribeRuleResponse  = DescribeRuleResponse { "Arn": (NullOrUndefined Nothing), "Description": (NullOrUndefined Nothing), "EventPattern": (NullOrUndefined Nothing), "Name": (NullOrUndefined Nothing), "RoleArn": (NullOrUndefined Nothing), "ScheduleExpression": (NullOrUndefined Nothing), "State": (NullOrUndefined Nothing) }

-- | Constructs DescribeRuleResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDescribeRuleResponse' :: ( { "Name" :: NullOrUndefined.NullOrUndefined (RuleName) , "Arn" :: NullOrUndefined.NullOrUndefined (RuleArn) , "EventPattern" :: NullOrUndefined.NullOrUndefined (EventPattern) , "ScheduleExpression" :: NullOrUndefined.NullOrUndefined (ScheduleExpression) , "State" :: NullOrUndefined.NullOrUndefined (RuleState) , "Description" :: NullOrUndefined.NullOrUndefined (RuleDescription) , "RoleArn" :: NullOrUndefined.NullOrUndefined (RoleArn) } -> {"Name" :: NullOrUndefined.NullOrUndefined (RuleName) , "Arn" :: NullOrUndefined.NullOrUndefined (RuleArn) , "EventPattern" :: NullOrUndefined.NullOrUndefined (EventPattern) , "ScheduleExpression" :: NullOrUndefined.NullOrUndefined (ScheduleExpression) , "State" :: NullOrUndefined.NullOrUndefined (RuleState) , "Description" :: NullOrUndefined.NullOrUndefined (RuleDescription) , "RoleArn" :: NullOrUndefined.NullOrUndefined (RoleArn) } ) -> DescribeRuleResponse
newDescribeRuleResponse'  customize = (DescribeRuleResponse <<< customize) { "Arn": (NullOrUndefined Nothing), "Description": (NullOrUndefined Nothing), "EventPattern": (NullOrUndefined Nothing), "Name": (NullOrUndefined Nothing), "RoleArn": (NullOrUndefined Nothing), "ScheduleExpression": (NullOrUndefined Nothing), "State": (NullOrUndefined Nothing) }



newtype DisableRuleRequest = DisableRuleRequest 
  { "Name" :: (RuleName)
  }
derive instance newtypeDisableRuleRequest :: Newtype DisableRuleRequest _
derive instance repGenericDisableRuleRequest :: Generic DisableRuleRequest _
instance showDisableRuleRequest :: Show DisableRuleRequest where
  show = genericShow
instance decodeDisableRuleRequest :: Decode DisableRuleRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeDisableRuleRequest :: Encode DisableRuleRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs DisableRuleRequest from required parameters
newDisableRuleRequest :: RuleName -> DisableRuleRequest
newDisableRuleRequest _Name = DisableRuleRequest { "Name": _Name }

-- | Constructs DisableRuleRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newDisableRuleRequest' :: RuleName -> ( { "Name" :: (RuleName) } -> {"Name" :: (RuleName) } ) -> DisableRuleRequest
newDisableRuleRequest' _Name customize = (DisableRuleRequest <<< customize) { "Name": _Name }



-- | <p>The custom parameters to be used when the target is an Amazon ECS cluster.</p>
newtype EcsParameters = EcsParameters 
  { "TaskDefinitionArn" :: (Arn)
  , "TaskCount" :: NullOrUndefined.NullOrUndefined (LimitMin1)
  }
derive instance newtypeEcsParameters :: Newtype EcsParameters _
derive instance repGenericEcsParameters :: Generic EcsParameters _
instance showEcsParameters :: Show EcsParameters where
  show = genericShow
instance decodeEcsParameters :: Decode EcsParameters where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeEcsParameters :: Encode EcsParameters where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs EcsParameters from required parameters
newEcsParameters :: Arn -> EcsParameters
newEcsParameters _TaskDefinitionArn = EcsParameters { "TaskDefinitionArn": _TaskDefinitionArn, "TaskCount": (NullOrUndefined Nothing) }

-- | Constructs EcsParameters's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newEcsParameters' :: Arn -> ( { "TaskDefinitionArn" :: (Arn) , "TaskCount" :: NullOrUndefined.NullOrUndefined (LimitMin1) } -> {"TaskDefinitionArn" :: (Arn) , "TaskCount" :: NullOrUndefined.NullOrUndefined (LimitMin1) } ) -> EcsParameters
newEcsParameters' _TaskDefinitionArn customize = (EcsParameters <<< customize) { "TaskDefinitionArn": _TaskDefinitionArn, "TaskCount": (NullOrUndefined Nothing) }



newtype EnableRuleRequest = EnableRuleRequest 
  { "Name" :: (RuleName)
  }
derive instance newtypeEnableRuleRequest :: Newtype EnableRuleRequest _
derive instance repGenericEnableRuleRequest :: Generic EnableRuleRequest _
instance showEnableRuleRequest :: Show EnableRuleRequest where
  show = genericShow
instance decodeEnableRuleRequest :: Decode EnableRuleRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeEnableRuleRequest :: Encode EnableRuleRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs EnableRuleRequest from required parameters
newEnableRuleRequest :: RuleName -> EnableRuleRequest
newEnableRuleRequest _Name = EnableRuleRequest { "Name": _Name }

-- | Constructs EnableRuleRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newEnableRuleRequest' :: RuleName -> ( { "Name" :: (RuleName) } -> {"Name" :: (RuleName) } ) -> EnableRuleRequest
newEnableRuleRequest' _Name customize = (EnableRuleRequest <<< customize) { "Name": _Name }



newtype ErrorCode = ErrorCode String
derive instance newtypeErrorCode :: Newtype ErrorCode _
derive instance repGenericErrorCode :: Generic ErrorCode _
instance showErrorCode :: Show ErrorCode where
  show = genericShow
instance decodeErrorCode :: Decode ErrorCode where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeErrorCode :: Encode ErrorCode where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ErrorMessage = ErrorMessage String
derive instance newtypeErrorMessage :: Newtype ErrorMessage _
derive instance repGenericErrorMessage :: Generic ErrorMessage _
instance showErrorMessage :: Show ErrorMessage where
  show = genericShow
instance decodeErrorMessage :: Decode ErrorMessage where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeErrorMessage :: Encode ErrorMessage where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype EventId = EventId String
derive instance newtypeEventId :: Newtype EventId _
derive instance repGenericEventId :: Generic EventId _
instance showEventId :: Show EventId where
  show = genericShow
instance decodeEventId :: Decode EventId where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeEventId :: Encode EventId where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype EventPattern = EventPattern String
derive instance newtypeEventPattern :: Newtype EventPattern _
derive instance repGenericEventPattern :: Generic EventPattern _
instance showEventPattern :: Show EventPattern where
  show = genericShow
instance decodeEventPattern :: Decode EventPattern where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeEventPattern :: Encode EventPattern where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype EventResource = EventResource String
derive instance newtypeEventResource :: Newtype EventResource _
derive instance repGenericEventResource :: Generic EventResource _
instance showEventResource :: Show EventResource where
  show = genericShow
instance decodeEventResource :: Decode EventResource where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeEventResource :: Encode EventResource where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype EventResourceList = EventResourceList (Array EventResource)
derive instance newtypeEventResourceList :: Newtype EventResourceList _
derive instance repGenericEventResourceList :: Generic EventResourceList _
instance showEventResourceList :: Show EventResourceList where
  show = genericShow
instance decodeEventResourceList :: Decode EventResourceList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeEventResourceList :: Encode EventResourceList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype EventTime = EventTime Types.Timestamp
derive instance newtypeEventTime :: Newtype EventTime _
derive instance repGenericEventTime :: Generic EventTime _
instance showEventTime :: Show EventTime where
  show = genericShow
instance decodeEventTime :: Decode EventTime where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeEventTime :: Encode EventTime where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Contains the parameters needed for you to provide custom input to a target based on one or more pieces of data extracted from the event.</p>
newtype InputTransformer = InputTransformer 
  { "InputPathsMap" :: NullOrUndefined.NullOrUndefined (TransformerPaths)
  , "InputTemplate" :: (TransformerInput)
  }
derive instance newtypeInputTransformer :: Newtype InputTransformer _
derive instance repGenericInputTransformer :: Generic InputTransformer _
instance showInputTransformer :: Show InputTransformer where
  show = genericShow
instance decodeInputTransformer :: Decode InputTransformer where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInputTransformer :: Encode InputTransformer where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs InputTransformer from required parameters
newInputTransformer :: TransformerInput -> InputTransformer
newInputTransformer _InputTemplate = InputTransformer { "InputTemplate": _InputTemplate, "InputPathsMap": (NullOrUndefined Nothing) }

-- | Constructs InputTransformer's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newInputTransformer' :: TransformerInput -> ( { "InputPathsMap" :: NullOrUndefined.NullOrUndefined (TransformerPaths) , "InputTemplate" :: (TransformerInput) } -> {"InputPathsMap" :: NullOrUndefined.NullOrUndefined (TransformerPaths) , "InputTemplate" :: (TransformerInput) } ) -> InputTransformer
newInputTransformer' _InputTemplate customize = (InputTransformer <<< customize) { "InputTemplate": _InputTemplate, "InputPathsMap": (NullOrUndefined Nothing) }



newtype InputTransformerPathKey = InputTransformerPathKey String
derive instance newtypeInputTransformerPathKey :: Newtype InputTransformerPathKey _
derive instance repGenericInputTransformerPathKey :: Generic InputTransformerPathKey _
instance showInputTransformerPathKey :: Show InputTransformerPathKey where
  show = genericShow
instance decodeInputTransformerPathKey :: Decode InputTransformerPathKey where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInputTransformerPathKey :: Encode InputTransformerPathKey where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>This exception occurs due to unexpected causes.</p>
newtype InternalException = InternalException Types.NoArguments
derive instance newtypeInternalException :: Newtype InternalException _
derive instance repGenericInternalException :: Generic InternalException _
instance showInternalException :: Show InternalException where
  show = genericShow
instance decodeInternalException :: Decode InternalException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInternalException :: Encode InternalException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The event pattern is not valid.</p>
newtype InvalidEventPatternException = InvalidEventPatternException Types.NoArguments
derive instance newtypeInvalidEventPatternException :: Newtype InvalidEventPatternException _
derive instance repGenericInvalidEventPatternException :: Generic InvalidEventPatternException _
instance showInvalidEventPatternException :: Show InvalidEventPatternException where
  show = genericShow
instance decodeInvalidEventPatternException :: Decode InvalidEventPatternException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeInvalidEventPatternException :: Encode InvalidEventPatternException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>This object enables you to specify a JSON path to extract from the event and use as the partition key for the Amazon Kinesis stream, so that you can control the shard to which the event goes. If you do not include this parameter, the default is to use the <code>eventId</code> as the partition key.</p>
newtype KinesisParameters = KinesisParameters 
  { "PartitionKeyPath" :: (TargetPartitionKeyPath)
  }
derive instance newtypeKinesisParameters :: Newtype KinesisParameters _
derive instance repGenericKinesisParameters :: Generic KinesisParameters _
instance showKinesisParameters :: Show KinesisParameters where
  show = genericShow
instance decodeKinesisParameters :: Decode KinesisParameters where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeKinesisParameters :: Encode KinesisParameters where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs KinesisParameters from required parameters
newKinesisParameters :: TargetPartitionKeyPath -> KinesisParameters
newKinesisParameters _PartitionKeyPath = KinesisParameters { "PartitionKeyPath": _PartitionKeyPath }

-- | Constructs KinesisParameters's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newKinesisParameters' :: TargetPartitionKeyPath -> ( { "PartitionKeyPath" :: (TargetPartitionKeyPath) } -> {"PartitionKeyPath" :: (TargetPartitionKeyPath) } ) -> KinesisParameters
newKinesisParameters' _PartitionKeyPath customize = (KinesisParameters <<< customize) { "PartitionKeyPath": _PartitionKeyPath }



-- | <p>You tried to create more rules or add more targets to a rule than is allowed.</p>
newtype LimitExceededException = LimitExceededException Types.NoArguments
derive instance newtypeLimitExceededException :: Newtype LimitExceededException _
derive instance repGenericLimitExceededException :: Generic LimitExceededException _
instance showLimitExceededException :: Show LimitExceededException where
  show = genericShow
instance decodeLimitExceededException :: Decode LimitExceededException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeLimitExceededException :: Encode LimitExceededException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype LimitMax100 = LimitMax100 Int
derive instance newtypeLimitMax100 :: Newtype LimitMax100 _
derive instance repGenericLimitMax100 :: Generic LimitMax100 _
instance showLimitMax100 :: Show LimitMax100 where
  show = genericShow
instance decodeLimitMax100 :: Decode LimitMax100 where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeLimitMax100 :: Encode LimitMax100 where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype LimitMin1 = LimitMin1 Int
derive instance newtypeLimitMin1 :: Newtype LimitMin1 _
derive instance repGenericLimitMin1 :: Generic LimitMin1 _
instance showLimitMin1 :: Show LimitMin1 where
  show = genericShow
instance decodeLimitMin1 :: Decode LimitMin1 where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeLimitMin1 :: Encode LimitMin1 where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ListRuleNamesByTargetRequest = ListRuleNamesByTargetRequest 
  { "TargetArn" :: (TargetArn)
  , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken)
  , "Limit" :: NullOrUndefined.NullOrUndefined (LimitMax100)
  }
derive instance newtypeListRuleNamesByTargetRequest :: Newtype ListRuleNamesByTargetRequest _
derive instance repGenericListRuleNamesByTargetRequest :: Generic ListRuleNamesByTargetRequest _
instance showListRuleNamesByTargetRequest :: Show ListRuleNamesByTargetRequest where
  show = genericShow
instance decodeListRuleNamesByTargetRequest :: Decode ListRuleNamesByTargetRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeListRuleNamesByTargetRequest :: Encode ListRuleNamesByTargetRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ListRuleNamesByTargetRequest from required parameters
newListRuleNamesByTargetRequest :: TargetArn -> ListRuleNamesByTargetRequest
newListRuleNamesByTargetRequest _TargetArn = ListRuleNamesByTargetRequest { "TargetArn": _TargetArn, "Limit": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }

-- | Constructs ListRuleNamesByTargetRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListRuleNamesByTargetRequest' :: TargetArn -> ( { "TargetArn" :: (TargetArn) , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken) , "Limit" :: NullOrUndefined.NullOrUndefined (LimitMax100) } -> {"TargetArn" :: (TargetArn) , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken) , "Limit" :: NullOrUndefined.NullOrUndefined (LimitMax100) } ) -> ListRuleNamesByTargetRequest
newListRuleNamesByTargetRequest' _TargetArn customize = (ListRuleNamesByTargetRequest <<< customize) { "TargetArn": _TargetArn, "Limit": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }



newtype ListRuleNamesByTargetResponse = ListRuleNamesByTargetResponse 
  { "RuleNames" :: NullOrUndefined.NullOrUndefined (RuleNameList)
  , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken)
  }
derive instance newtypeListRuleNamesByTargetResponse :: Newtype ListRuleNamesByTargetResponse _
derive instance repGenericListRuleNamesByTargetResponse :: Generic ListRuleNamesByTargetResponse _
instance showListRuleNamesByTargetResponse :: Show ListRuleNamesByTargetResponse where
  show = genericShow
instance decodeListRuleNamesByTargetResponse :: Decode ListRuleNamesByTargetResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeListRuleNamesByTargetResponse :: Encode ListRuleNamesByTargetResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ListRuleNamesByTargetResponse from required parameters
newListRuleNamesByTargetResponse :: ListRuleNamesByTargetResponse
newListRuleNamesByTargetResponse  = ListRuleNamesByTargetResponse { "NextToken": (NullOrUndefined Nothing), "RuleNames": (NullOrUndefined Nothing) }

-- | Constructs ListRuleNamesByTargetResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListRuleNamesByTargetResponse' :: ( { "RuleNames" :: NullOrUndefined.NullOrUndefined (RuleNameList) , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken) } -> {"RuleNames" :: NullOrUndefined.NullOrUndefined (RuleNameList) , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken) } ) -> ListRuleNamesByTargetResponse
newListRuleNamesByTargetResponse'  customize = (ListRuleNamesByTargetResponse <<< customize) { "NextToken": (NullOrUndefined Nothing), "RuleNames": (NullOrUndefined Nothing) }



newtype ListRulesRequest = ListRulesRequest 
  { "NamePrefix" :: NullOrUndefined.NullOrUndefined (RuleName)
  , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken)
  , "Limit" :: NullOrUndefined.NullOrUndefined (LimitMax100)
  }
derive instance newtypeListRulesRequest :: Newtype ListRulesRequest _
derive instance repGenericListRulesRequest :: Generic ListRulesRequest _
instance showListRulesRequest :: Show ListRulesRequest where
  show = genericShow
instance decodeListRulesRequest :: Decode ListRulesRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeListRulesRequest :: Encode ListRulesRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ListRulesRequest from required parameters
newListRulesRequest :: ListRulesRequest
newListRulesRequest  = ListRulesRequest { "Limit": (NullOrUndefined Nothing), "NamePrefix": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }

-- | Constructs ListRulesRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListRulesRequest' :: ( { "NamePrefix" :: NullOrUndefined.NullOrUndefined (RuleName) , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken) , "Limit" :: NullOrUndefined.NullOrUndefined (LimitMax100) } -> {"NamePrefix" :: NullOrUndefined.NullOrUndefined (RuleName) , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken) , "Limit" :: NullOrUndefined.NullOrUndefined (LimitMax100) } ) -> ListRulesRequest
newListRulesRequest'  customize = (ListRulesRequest <<< customize) { "Limit": (NullOrUndefined Nothing), "NamePrefix": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }



newtype ListRulesResponse = ListRulesResponse 
  { "Rules" :: NullOrUndefined.NullOrUndefined (RuleResponseList)
  , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken)
  }
derive instance newtypeListRulesResponse :: Newtype ListRulesResponse _
derive instance repGenericListRulesResponse :: Generic ListRulesResponse _
instance showListRulesResponse :: Show ListRulesResponse where
  show = genericShow
instance decodeListRulesResponse :: Decode ListRulesResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeListRulesResponse :: Encode ListRulesResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ListRulesResponse from required parameters
newListRulesResponse :: ListRulesResponse
newListRulesResponse  = ListRulesResponse { "NextToken": (NullOrUndefined Nothing), "Rules": (NullOrUndefined Nothing) }

-- | Constructs ListRulesResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListRulesResponse' :: ( { "Rules" :: NullOrUndefined.NullOrUndefined (RuleResponseList) , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken) } -> {"Rules" :: NullOrUndefined.NullOrUndefined (RuleResponseList) , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken) } ) -> ListRulesResponse
newListRulesResponse'  customize = (ListRulesResponse <<< customize) { "NextToken": (NullOrUndefined Nothing), "Rules": (NullOrUndefined Nothing) }



newtype ListTargetsByRuleRequest = ListTargetsByRuleRequest 
  { "Rule" :: (RuleName)
  , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken)
  , "Limit" :: NullOrUndefined.NullOrUndefined (LimitMax100)
  }
derive instance newtypeListTargetsByRuleRequest :: Newtype ListTargetsByRuleRequest _
derive instance repGenericListTargetsByRuleRequest :: Generic ListTargetsByRuleRequest _
instance showListTargetsByRuleRequest :: Show ListTargetsByRuleRequest where
  show = genericShow
instance decodeListTargetsByRuleRequest :: Decode ListTargetsByRuleRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeListTargetsByRuleRequest :: Encode ListTargetsByRuleRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ListTargetsByRuleRequest from required parameters
newListTargetsByRuleRequest :: RuleName -> ListTargetsByRuleRequest
newListTargetsByRuleRequest _Rule = ListTargetsByRuleRequest { "Rule": _Rule, "Limit": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }

-- | Constructs ListTargetsByRuleRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListTargetsByRuleRequest' :: RuleName -> ( { "Rule" :: (RuleName) , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken) , "Limit" :: NullOrUndefined.NullOrUndefined (LimitMax100) } -> {"Rule" :: (RuleName) , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken) , "Limit" :: NullOrUndefined.NullOrUndefined (LimitMax100) } ) -> ListTargetsByRuleRequest
newListTargetsByRuleRequest' _Rule customize = (ListTargetsByRuleRequest <<< customize) { "Rule": _Rule, "Limit": (NullOrUndefined Nothing), "NextToken": (NullOrUndefined Nothing) }



newtype ListTargetsByRuleResponse = ListTargetsByRuleResponse 
  { "Targets" :: NullOrUndefined.NullOrUndefined (TargetList)
  , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken)
  }
derive instance newtypeListTargetsByRuleResponse :: Newtype ListTargetsByRuleResponse _
derive instance repGenericListTargetsByRuleResponse :: Generic ListTargetsByRuleResponse _
instance showListTargetsByRuleResponse :: Show ListTargetsByRuleResponse where
  show = genericShow
instance decodeListTargetsByRuleResponse :: Decode ListTargetsByRuleResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeListTargetsByRuleResponse :: Encode ListTargetsByRuleResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs ListTargetsByRuleResponse from required parameters
newListTargetsByRuleResponse :: ListTargetsByRuleResponse
newListTargetsByRuleResponse  = ListTargetsByRuleResponse { "NextToken": (NullOrUndefined Nothing), "Targets": (NullOrUndefined Nothing) }

-- | Constructs ListTargetsByRuleResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newListTargetsByRuleResponse' :: ( { "Targets" :: NullOrUndefined.NullOrUndefined (TargetList) , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken) } -> {"Targets" :: NullOrUndefined.NullOrUndefined (TargetList) , "NextToken" :: NullOrUndefined.NullOrUndefined (NextToken) } ) -> ListTargetsByRuleResponse
newListTargetsByRuleResponse'  customize = (ListTargetsByRuleResponse <<< customize) { "NextToken": (NullOrUndefined Nothing), "Targets": (NullOrUndefined Nothing) }



newtype NextToken = NextToken String
derive instance newtypeNextToken :: Newtype NextToken _
derive instance repGenericNextToken :: Generic NextToken _
instance showNextToken :: Show NextToken where
  show = genericShow
instance decodeNextToken :: Decode NextToken where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeNextToken :: Encode NextToken where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>The event bus policy is too long. For more information, see the limits.</p>
newtype PolicyLengthExceededException = PolicyLengthExceededException Types.NoArguments
derive instance newtypePolicyLengthExceededException :: Newtype PolicyLengthExceededException _
derive instance repGenericPolicyLengthExceededException :: Generic PolicyLengthExceededException _
instance showPolicyLengthExceededException :: Show PolicyLengthExceededException where
  show = genericShow
instance decodePolicyLengthExceededException :: Decode PolicyLengthExceededException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePolicyLengthExceededException :: Encode PolicyLengthExceededException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype Principal = Principal String
derive instance newtypePrincipal :: Newtype Principal _
derive instance repGenericPrincipal :: Generic Principal _
instance showPrincipal :: Show Principal where
  show = genericShow
instance decodePrincipal :: Decode Principal where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePrincipal :: Encode Principal where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype PutEventsRequest = PutEventsRequest 
  { "Entries" :: (PutEventsRequestEntryList)
  }
derive instance newtypePutEventsRequest :: Newtype PutEventsRequest _
derive instance repGenericPutEventsRequest :: Generic PutEventsRequest _
instance showPutEventsRequest :: Show PutEventsRequest where
  show = genericShow
instance decodePutEventsRequest :: Decode PutEventsRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutEventsRequest :: Encode PutEventsRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PutEventsRequest from required parameters
newPutEventsRequest :: PutEventsRequestEntryList -> PutEventsRequest
newPutEventsRequest _Entries = PutEventsRequest { "Entries": _Entries }

-- | Constructs PutEventsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutEventsRequest' :: PutEventsRequestEntryList -> ( { "Entries" :: (PutEventsRequestEntryList) } -> {"Entries" :: (PutEventsRequestEntryList) } ) -> PutEventsRequest
newPutEventsRequest' _Entries customize = (PutEventsRequest <<< customize) { "Entries": _Entries }



-- | <p>Represents an event to be submitted.</p>
newtype PutEventsRequestEntry = PutEventsRequestEntry 
  { "Time" :: NullOrUndefined.NullOrUndefined (EventTime)
  , "Source" :: NullOrUndefined.NullOrUndefined (String)
  , "Resources" :: NullOrUndefined.NullOrUndefined (EventResourceList)
  , "DetailType" :: NullOrUndefined.NullOrUndefined (String)
  , "Detail" :: NullOrUndefined.NullOrUndefined (String)
  }
derive instance newtypePutEventsRequestEntry :: Newtype PutEventsRequestEntry _
derive instance repGenericPutEventsRequestEntry :: Generic PutEventsRequestEntry _
instance showPutEventsRequestEntry :: Show PutEventsRequestEntry where
  show = genericShow
instance decodePutEventsRequestEntry :: Decode PutEventsRequestEntry where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutEventsRequestEntry :: Encode PutEventsRequestEntry where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PutEventsRequestEntry from required parameters
newPutEventsRequestEntry :: PutEventsRequestEntry
newPutEventsRequestEntry  = PutEventsRequestEntry { "Detail": (NullOrUndefined Nothing), "DetailType": (NullOrUndefined Nothing), "Resources": (NullOrUndefined Nothing), "Source": (NullOrUndefined Nothing), "Time": (NullOrUndefined Nothing) }

-- | Constructs PutEventsRequestEntry's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutEventsRequestEntry' :: ( { "Time" :: NullOrUndefined.NullOrUndefined (EventTime) , "Source" :: NullOrUndefined.NullOrUndefined (String) , "Resources" :: NullOrUndefined.NullOrUndefined (EventResourceList) , "DetailType" :: NullOrUndefined.NullOrUndefined (String) , "Detail" :: NullOrUndefined.NullOrUndefined (String) } -> {"Time" :: NullOrUndefined.NullOrUndefined (EventTime) , "Source" :: NullOrUndefined.NullOrUndefined (String) , "Resources" :: NullOrUndefined.NullOrUndefined (EventResourceList) , "DetailType" :: NullOrUndefined.NullOrUndefined (String) , "Detail" :: NullOrUndefined.NullOrUndefined (String) } ) -> PutEventsRequestEntry
newPutEventsRequestEntry'  customize = (PutEventsRequestEntry <<< customize) { "Detail": (NullOrUndefined Nothing), "DetailType": (NullOrUndefined Nothing), "Resources": (NullOrUndefined Nothing), "Source": (NullOrUndefined Nothing), "Time": (NullOrUndefined Nothing) }



newtype PutEventsRequestEntryList = PutEventsRequestEntryList (Array PutEventsRequestEntry)
derive instance newtypePutEventsRequestEntryList :: Newtype PutEventsRequestEntryList _
derive instance repGenericPutEventsRequestEntryList :: Generic PutEventsRequestEntryList _
instance showPutEventsRequestEntryList :: Show PutEventsRequestEntryList where
  show = genericShow
instance decodePutEventsRequestEntryList :: Decode PutEventsRequestEntryList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutEventsRequestEntryList :: Encode PutEventsRequestEntryList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype PutEventsResponse = PutEventsResponse 
  { "FailedEntryCount" :: NullOrUndefined.NullOrUndefined (Int)
  , "Entries" :: NullOrUndefined.NullOrUndefined (PutEventsResultEntryList)
  }
derive instance newtypePutEventsResponse :: Newtype PutEventsResponse _
derive instance repGenericPutEventsResponse :: Generic PutEventsResponse _
instance showPutEventsResponse :: Show PutEventsResponse where
  show = genericShow
instance decodePutEventsResponse :: Decode PutEventsResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutEventsResponse :: Encode PutEventsResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PutEventsResponse from required parameters
newPutEventsResponse :: PutEventsResponse
newPutEventsResponse  = PutEventsResponse { "Entries": (NullOrUndefined Nothing), "FailedEntryCount": (NullOrUndefined Nothing) }

-- | Constructs PutEventsResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutEventsResponse' :: ( { "FailedEntryCount" :: NullOrUndefined.NullOrUndefined (Int) , "Entries" :: NullOrUndefined.NullOrUndefined (PutEventsResultEntryList) } -> {"FailedEntryCount" :: NullOrUndefined.NullOrUndefined (Int) , "Entries" :: NullOrUndefined.NullOrUndefined (PutEventsResultEntryList) } ) -> PutEventsResponse
newPutEventsResponse'  customize = (PutEventsResponse <<< customize) { "Entries": (NullOrUndefined Nothing), "FailedEntryCount": (NullOrUndefined Nothing) }



-- | <p>Represents an event that failed to be submitted.</p>
newtype PutEventsResultEntry = PutEventsResultEntry 
  { "EventId" :: NullOrUndefined.NullOrUndefined (EventId)
  , "ErrorCode" :: NullOrUndefined.NullOrUndefined (ErrorCode)
  , "ErrorMessage" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypePutEventsResultEntry :: Newtype PutEventsResultEntry _
derive instance repGenericPutEventsResultEntry :: Generic PutEventsResultEntry _
instance showPutEventsResultEntry :: Show PutEventsResultEntry where
  show = genericShow
instance decodePutEventsResultEntry :: Decode PutEventsResultEntry where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutEventsResultEntry :: Encode PutEventsResultEntry where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PutEventsResultEntry from required parameters
newPutEventsResultEntry :: PutEventsResultEntry
newPutEventsResultEntry  = PutEventsResultEntry { "ErrorCode": (NullOrUndefined Nothing), "ErrorMessage": (NullOrUndefined Nothing), "EventId": (NullOrUndefined Nothing) }

-- | Constructs PutEventsResultEntry's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutEventsResultEntry' :: ( { "EventId" :: NullOrUndefined.NullOrUndefined (EventId) , "ErrorCode" :: NullOrUndefined.NullOrUndefined (ErrorCode) , "ErrorMessage" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"EventId" :: NullOrUndefined.NullOrUndefined (EventId) , "ErrorCode" :: NullOrUndefined.NullOrUndefined (ErrorCode) , "ErrorMessage" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> PutEventsResultEntry
newPutEventsResultEntry'  customize = (PutEventsResultEntry <<< customize) { "ErrorCode": (NullOrUndefined Nothing), "ErrorMessage": (NullOrUndefined Nothing), "EventId": (NullOrUndefined Nothing) }



newtype PutEventsResultEntryList = PutEventsResultEntryList (Array PutEventsResultEntry)
derive instance newtypePutEventsResultEntryList :: Newtype PutEventsResultEntryList _
derive instance repGenericPutEventsResultEntryList :: Generic PutEventsResultEntryList _
instance showPutEventsResultEntryList :: Show PutEventsResultEntryList where
  show = genericShow
instance decodePutEventsResultEntryList :: Decode PutEventsResultEntryList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutEventsResultEntryList :: Encode PutEventsResultEntryList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype PutPermissionRequest = PutPermissionRequest 
  { "Action" :: (Action)
  , "Principal" :: (Principal)
  , "StatementId" :: (StatementId)
  }
derive instance newtypePutPermissionRequest :: Newtype PutPermissionRequest _
derive instance repGenericPutPermissionRequest :: Generic PutPermissionRequest _
instance showPutPermissionRequest :: Show PutPermissionRequest where
  show = genericShow
instance decodePutPermissionRequest :: Decode PutPermissionRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutPermissionRequest :: Encode PutPermissionRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PutPermissionRequest from required parameters
newPutPermissionRequest :: Action -> Principal -> StatementId -> PutPermissionRequest
newPutPermissionRequest _Action _Principal _StatementId = PutPermissionRequest { "Action": _Action, "Principal": _Principal, "StatementId": _StatementId }

-- | Constructs PutPermissionRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutPermissionRequest' :: Action -> Principal -> StatementId -> ( { "Action" :: (Action) , "Principal" :: (Principal) , "StatementId" :: (StatementId) } -> {"Action" :: (Action) , "Principal" :: (Principal) , "StatementId" :: (StatementId) } ) -> PutPermissionRequest
newPutPermissionRequest' _Action _Principal _StatementId customize = (PutPermissionRequest <<< customize) { "Action": _Action, "Principal": _Principal, "StatementId": _StatementId }



newtype PutRuleRequest = PutRuleRequest 
  { "Name" :: (RuleName)
  , "ScheduleExpression" :: NullOrUndefined.NullOrUndefined (ScheduleExpression)
  , "EventPattern" :: NullOrUndefined.NullOrUndefined (EventPattern)
  , "State" :: NullOrUndefined.NullOrUndefined (RuleState)
  , "Description" :: NullOrUndefined.NullOrUndefined (RuleDescription)
  , "RoleArn" :: NullOrUndefined.NullOrUndefined (RoleArn)
  }
derive instance newtypePutRuleRequest :: Newtype PutRuleRequest _
derive instance repGenericPutRuleRequest :: Generic PutRuleRequest _
instance showPutRuleRequest :: Show PutRuleRequest where
  show = genericShow
instance decodePutRuleRequest :: Decode PutRuleRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutRuleRequest :: Encode PutRuleRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PutRuleRequest from required parameters
newPutRuleRequest :: RuleName -> PutRuleRequest
newPutRuleRequest _Name = PutRuleRequest { "Name": _Name, "Description": (NullOrUndefined Nothing), "EventPattern": (NullOrUndefined Nothing), "RoleArn": (NullOrUndefined Nothing), "ScheduleExpression": (NullOrUndefined Nothing), "State": (NullOrUndefined Nothing) }

-- | Constructs PutRuleRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutRuleRequest' :: RuleName -> ( { "Name" :: (RuleName) , "ScheduleExpression" :: NullOrUndefined.NullOrUndefined (ScheduleExpression) , "EventPattern" :: NullOrUndefined.NullOrUndefined (EventPattern) , "State" :: NullOrUndefined.NullOrUndefined (RuleState) , "Description" :: NullOrUndefined.NullOrUndefined (RuleDescription) , "RoleArn" :: NullOrUndefined.NullOrUndefined (RoleArn) } -> {"Name" :: (RuleName) , "ScheduleExpression" :: NullOrUndefined.NullOrUndefined (ScheduleExpression) , "EventPattern" :: NullOrUndefined.NullOrUndefined (EventPattern) , "State" :: NullOrUndefined.NullOrUndefined (RuleState) , "Description" :: NullOrUndefined.NullOrUndefined (RuleDescription) , "RoleArn" :: NullOrUndefined.NullOrUndefined (RoleArn) } ) -> PutRuleRequest
newPutRuleRequest' _Name customize = (PutRuleRequest <<< customize) { "Name": _Name, "Description": (NullOrUndefined Nothing), "EventPattern": (NullOrUndefined Nothing), "RoleArn": (NullOrUndefined Nothing), "ScheduleExpression": (NullOrUndefined Nothing), "State": (NullOrUndefined Nothing) }



newtype PutRuleResponse = PutRuleResponse 
  { "RuleArn" :: NullOrUndefined.NullOrUndefined (RuleArn)
  }
derive instance newtypePutRuleResponse :: Newtype PutRuleResponse _
derive instance repGenericPutRuleResponse :: Generic PutRuleResponse _
instance showPutRuleResponse :: Show PutRuleResponse where
  show = genericShow
instance decodePutRuleResponse :: Decode PutRuleResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutRuleResponse :: Encode PutRuleResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PutRuleResponse from required parameters
newPutRuleResponse :: PutRuleResponse
newPutRuleResponse  = PutRuleResponse { "RuleArn": (NullOrUndefined Nothing) }

-- | Constructs PutRuleResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutRuleResponse' :: ( { "RuleArn" :: NullOrUndefined.NullOrUndefined (RuleArn) } -> {"RuleArn" :: NullOrUndefined.NullOrUndefined (RuleArn) } ) -> PutRuleResponse
newPutRuleResponse'  customize = (PutRuleResponse <<< customize) { "RuleArn": (NullOrUndefined Nothing) }



newtype PutTargetsRequest = PutTargetsRequest 
  { "Rule" :: (RuleName)
  , "Targets" :: (TargetList)
  }
derive instance newtypePutTargetsRequest :: Newtype PutTargetsRequest _
derive instance repGenericPutTargetsRequest :: Generic PutTargetsRequest _
instance showPutTargetsRequest :: Show PutTargetsRequest where
  show = genericShow
instance decodePutTargetsRequest :: Decode PutTargetsRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutTargetsRequest :: Encode PutTargetsRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PutTargetsRequest from required parameters
newPutTargetsRequest :: RuleName -> TargetList -> PutTargetsRequest
newPutTargetsRequest _Rule _Targets = PutTargetsRequest { "Rule": _Rule, "Targets": _Targets }

-- | Constructs PutTargetsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutTargetsRequest' :: RuleName -> TargetList -> ( { "Rule" :: (RuleName) , "Targets" :: (TargetList) } -> {"Rule" :: (RuleName) , "Targets" :: (TargetList) } ) -> PutTargetsRequest
newPutTargetsRequest' _Rule _Targets customize = (PutTargetsRequest <<< customize) { "Rule": _Rule, "Targets": _Targets }



newtype PutTargetsResponse = PutTargetsResponse 
  { "FailedEntryCount" :: NullOrUndefined.NullOrUndefined (Int)
  , "FailedEntries" :: NullOrUndefined.NullOrUndefined (PutTargetsResultEntryList)
  }
derive instance newtypePutTargetsResponse :: Newtype PutTargetsResponse _
derive instance repGenericPutTargetsResponse :: Generic PutTargetsResponse _
instance showPutTargetsResponse :: Show PutTargetsResponse where
  show = genericShow
instance decodePutTargetsResponse :: Decode PutTargetsResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutTargetsResponse :: Encode PutTargetsResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PutTargetsResponse from required parameters
newPutTargetsResponse :: PutTargetsResponse
newPutTargetsResponse  = PutTargetsResponse { "FailedEntries": (NullOrUndefined Nothing), "FailedEntryCount": (NullOrUndefined Nothing) }

-- | Constructs PutTargetsResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutTargetsResponse' :: ( { "FailedEntryCount" :: NullOrUndefined.NullOrUndefined (Int) , "FailedEntries" :: NullOrUndefined.NullOrUndefined (PutTargetsResultEntryList) } -> {"FailedEntryCount" :: NullOrUndefined.NullOrUndefined (Int) , "FailedEntries" :: NullOrUndefined.NullOrUndefined (PutTargetsResultEntryList) } ) -> PutTargetsResponse
newPutTargetsResponse'  customize = (PutTargetsResponse <<< customize) { "FailedEntries": (NullOrUndefined Nothing), "FailedEntryCount": (NullOrUndefined Nothing) }



-- | <p>Represents a target that failed to be added to a rule.</p>
newtype PutTargetsResultEntry = PutTargetsResultEntry 
  { "TargetId" :: NullOrUndefined.NullOrUndefined (TargetId)
  , "ErrorCode" :: NullOrUndefined.NullOrUndefined (ErrorCode)
  , "ErrorMessage" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypePutTargetsResultEntry :: Newtype PutTargetsResultEntry _
derive instance repGenericPutTargetsResultEntry :: Generic PutTargetsResultEntry _
instance showPutTargetsResultEntry :: Show PutTargetsResultEntry where
  show = genericShow
instance decodePutTargetsResultEntry :: Decode PutTargetsResultEntry where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutTargetsResultEntry :: Encode PutTargetsResultEntry where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs PutTargetsResultEntry from required parameters
newPutTargetsResultEntry :: PutTargetsResultEntry
newPutTargetsResultEntry  = PutTargetsResultEntry { "ErrorCode": (NullOrUndefined Nothing), "ErrorMessage": (NullOrUndefined Nothing), "TargetId": (NullOrUndefined Nothing) }

-- | Constructs PutTargetsResultEntry's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newPutTargetsResultEntry' :: ( { "TargetId" :: NullOrUndefined.NullOrUndefined (TargetId) , "ErrorCode" :: NullOrUndefined.NullOrUndefined (ErrorCode) , "ErrorMessage" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"TargetId" :: NullOrUndefined.NullOrUndefined (TargetId) , "ErrorCode" :: NullOrUndefined.NullOrUndefined (ErrorCode) , "ErrorMessage" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> PutTargetsResultEntry
newPutTargetsResultEntry'  customize = (PutTargetsResultEntry <<< customize) { "ErrorCode": (NullOrUndefined Nothing), "ErrorMessage": (NullOrUndefined Nothing), "TargetId": (NullOrUndefined Nothing) }



newtype PutTargetsResultEntryList = PutTargetsResultEntryList (Array PutTargetsResultEntry)
derive instance newtypePutTargetsResultEntryList :: Newtype PutTargetsResultEntryList _
derive instance repGenericPutTargetsResultEntryList :: Generic PutTargetsResultEntryList _
instance showPutTargetsResultEntryList :: Show PutTargetsResultEntryList where
  show = genericShow
instance decodePutTargetsResultEntryList :: Decode PutTargetsResultEntryList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodePutTargetsResultEntryList :: Encode PutTargetsResultEntryList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype RemovePermissionRequest = RemovePermissionRequest 
  { "StatementId" :: (StatementId)
  }
derive instance newtypeRemovePermissionRequest :: Newtype RemovePermissionRequest _
derive instance repGenericRemovePermissionRequest :: Generic RemovePermissionRequest _
instance showRemovePermissionRequest :: Show RemovePermissionRequest where
  show = genericShow
instance decodeRemovePermissionRequest :: Decode RemovePermissionRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRemovePermissionRequest :: Encode RemovePermissionRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs RemovePermissionRequest from required parameters
newRemovePermissionRequest :: StatementId -> RemovePermissionRequest
newRemovePermissionRequest _StatementId = RemovePermissionRequest { "StatementId": _StatementId }

-- | Constructs RemovePermissionRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRemovePermissionRequest' :: StatementId -> ( { "StatementId" :: (StatementId) } -> {"StatementId" :: (StatementId) } ) -> RemovePermissionRequest
newRemovePermissionRequest' _StatementId customize = (RemovePermissionRequest <<< customize) { "StatementId": _StatementId }



newtype RemoveTargetsRequest = RemoveTargetsRequest 
  { "Rule" :: (RuleName)
  , "Ids" :: (TargetIdList)
  }
derive instance newtypeRemoveTargetsRequest :: Newtype RemoveTargetsRequest _
derive instance repGenericRemoveTargetsRequest :: Generic RemoveTargetsRequest _
instance showRemoveTargetsRequest :: Show RemoveTargetsRequest where
  show = genericShow
instance decodeRemoveTargetsRequest :: Decode RemoveTargetsRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRemoveTargetsRequest :: Encode RemoveTargetsRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs RemoveTargetsRequest from required parameters
newRemoveTargetsRequest :: TargetIdList -> RuleName -> RemoveTargetsRequest
newRemoveTargetsRequest _Ids _Rule = RemoveTargetsRequest { "Ids": _Ids, "Rule": _Rule }

-- | Constructs RemoveTargetsRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRemoveTargetsRequest' :: TargetIdList -> RuleName -> ( { "Rule" :: (RuleName) , "Ids" :: (TargetIdList) } -> {"Rule" :: (RuleName) , "Ids" :: (TargetIdList) } ) -> RemoveTargetsRequest
newRemoveTargetsRequest' _Ids _Rule customize = (RemoveTargetsRequest <<< customize) { "Ids": _Ids, "Rule": _Rule }



newtype RemoveTargetsResponse = RemoveTargetsResponse 
  { "FailedEntryCount" :: NullOrUndefined.NullOrUndefined (Int)
  , "FailedEntries" :: NullOrUndefined.NullOrUndefined (RemoveTargetsResultEntryList)
  }
derive instance newtypeRemoveTargetsResponse :: Newtype RemoveTargetsResponse _
derive instance repGenericRemoveTargetsResponse :: Generic RemoveTargetsResponse _
instance showRemoveTargetsResponse :: Show RemoveTargetsResponse where
  show = genericShow
instance decodeRemoveTargetsResponse :: Decode RemoveTargetsResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRemoveTargetsResponse :: Encode RemoveTargetsResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs RemoveTargetsResponse from required parameters
newRemoveTargetsResponse :: RemoveTargetsResponse
newRemoveTargetsResponse  = RemoveTargetsResponse { "FailedEntries": (NullOrUndefined Nothing), "FailedEntryCount": (NullOrUndefined Nothing) }

-- | Constructs RemoveTargetsResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRemoveTargetsResponse' :: ( { "FailedEntryCount" :: NullOrUndefined.NullOrUndefined (Int) , "FailedEntries" :: NullOrUndefined.NullOrUndefined (RemoveTargetsResultEntryList) } -> {"FailedEntryCount" :: NullOrUndefined.NullOrUndefined (Int) , "FailedEntries" :: NullOrUndefined.NullOrUndefined (RemoveTargetsResultEntryList) } ) -> RemoveTargetsResponse
newRemoveTargetsResponse'  customize = (RemoveTargetsResponse <<< customize) { "FailedEntries": (NullOrUndefined Nothing), "FailedEntryCount": (NullOrUndefined Nothing) }



-- | <p>Represents a target that failed to be removed from a rule.</p>
newtype RemoveTargetsResultEntry = RemoveTargetsResultEntry 
  { "TargetId" :: NullOrUndefined.NullOrUndefined (TargetId)
  , "ErrorCode" :: NullOrUndefined.NullOrUndefined (ErrorCode)
  , "ErrorMessage" :: NullOrUndefined.NullOrUndefined (ErrorMessage)
  }
derive instance newtypeRemoveTargetsResultEntry :: Newtype RemoveTargetsResultEntry _
derive instance repGenericRemoveTargetsResultEntry :: Generic RemoveTargetsResultEntry _
instance showRemoveTargetsResultEntry :: Show RemoveTargetsResultEntry where
  show = genericShow
instance decodeRemoveTargetsResultEntry :: Decode RemoveTargetsResultEntry where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRemoveTargetsResultEntry :: Encode RemoveTargetsResultEntry where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs RemoveTargetsResultEntry from required parameters
newRemoveTargetsResultEntry :: RemoveTargetsResultEntry
newRemoveTargetsResultEntry  = RemoveTargetsResultEntry { "ErrorCode": (NullOrUndefined Nothing), "ErrorMessage": (NullOrUndefined Nothing), "TargetId": (NullOrUndefined Nothing) }

-- | Constructs RemoveTargetsResultEntry's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRemoveTargetsResultEntry' :: ( { "TargetId" :: NullOrUndefined.NullOrUndefined (TargetId) , "ErrorCode" :: NullOrUndefined.NullOrUndefined (ErrorCode) , "ErrorMessage" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } -> {"TargetId" :: NullOrUndefined.NullOrUndefined (TargetId) , "ErrorCode" :: NullOrUndefined.NullOrUndefined (ErrorCode) , "ErrorMessage" :: NullOrUndefined.NullOrUndefined (ErrorMessage) } ) -> RemoveTargetsResultEntry
newRemoveTargetsResultEntry'  customize = (RemoveTargetsResultEntry <<< customize) { "ErrorCode": (NullOrUndefined Nothing), "ErrorMessage": (NullOrUndefined Nothing), "TargetId": (NullOrUndefined Nothing) }



newtype RemoveTargetsResultEntryList = RemoveTargetsResultEntryList (Array RemoveTargetsResultEntry)
derive instance newtypeRemoveTargetsResultEntryList :: Newtype RemoveTargetsResultEntryList _
derive instance repGenericRemoveTargetsResultEntryList :: Generic RemoveTargetsResultEntryList _
instance showRemoveTargetsResultEntryList :: Show RemoveTargetsResultEntryList where
  show = genericShow
instance decodeRemoveTargetsResultEntryList :: Decode RemoveTargetsResultEntryList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRemoveTargetsResultEntryList :: Encode RemoveTargetsResultEntryList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>An entity that you specified does not exist.</p>
newtype ResourceNotFoundException = ResourceNotFoundException Types.NoArguments
derive instance newtypeResourceNotFoundException :: Newtype ResourceNotFoundException _
derive instance repGenericResourceNotFoundException :: Generic ResourceNotFoundException _
instance showResourceNotFoundException :: Show ResourceNotFoundException where
  show = genericShow
instance decodeResourceNotFoundException :: Decode ResourceNotFoundException where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeResourceNotFoundException :: Encode ResourceNotFoundException where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype RoleArn = RoleArn String
derive instance newtypeRoleArn :: Newtype RoleArn _
derive instance repGenericRoleArn :: Generic RoleArn _
instance showRoleArn :: Show RoleArn where
  show = genericShow
instance decodeRoleArn :: Decode RoleArn where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRoleArn :: Encode RoleArn where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Contains information about a rule in Amazon CloudWatch Events.</p>
newtype Rule = Rule 
  { "Name" :: NullOrUndefined.NullOrUndefined (RuleName)
  , "Arn" :: NullOrUndefined.NullOrUndefined (RuleArn)
  , "EventPattern" :: NullOrUndefined.NullOrUndefined (EventPattern)
  , "State" :: NullOrUndefined.NullOrUndefined (RuleState)
  , "Description" :: NullOrUndefined.NullOrUndefined (RuleDescription)
  , "ScheduleExpression" :: NullOrUndefined.NullOrUndefined (ScheduleExpression)
  , "RoleArn" :: NullOrUndefined.NullOrUndefined (RoleArn)
  }
derive instance newtypeRule :: Newtype Rule _
derive instance repGenericRule :: Generic Rule _
instance showRule :: Show Rule where
  show = genericShow
instance decodeRule :: Decode Rule where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRule :: Encode Rule where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Rule from required parameters
newRule :: Rule
newRule  = Rule { "Arn": (NullOrUndefined Nothing), "Description": (NullOrUndefined Nothing), "EventPattern": (NullOrUndefined Nothing), "Name": (NullOrUndefined Nothing), "RoleArn": (NullOrUndefined Nothing), "ScheduleExpression": (NullOrUndefined Nothing), "State": (NullOrUndefined Nothing) }

-- | Constructs Rule's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRule' :: ( { "Name" :: NullOrUndefined.NullOrUndefined (RuleName) , "Arn" :: NullOrUndefined.NullOrUndefined (RuleArn) , "EventPattern" :: NullOrUndefined.NullOrUndefined (EventPattern) , "State" :: NullOrUndefined.NullOrUndefined (RuleState) , "Description" :: NullOrUndefined.NullOrUndefined (RuleDescription) , "ScheduleExpression" :: NullOrUndefined.NullOrUndefined (ScheduleExpression) , "RoleArn" :: NullOrUndefined.NullOrUndefined (RoleArn) } -> {"Name" :: NullOrUndefined.NullOrUndefined (RuleName) , "Arn" :: NullOrUndefined.NullOrUndefined (RuleArn) , "EventPattern" :: NullOrUndefined.NullOrUndefined (EventPattern) , "State" :: NullOrUndefined.NullOrUndefined (RuleState) , "Description" :: NullOrUndefined.NullOrUndefined (RuleDescription) , "ScheduleExpression" :: NullOrUndefined.NullOrUndefined (ScheduleExpression) , "RoleArn" :: NullOrUndefined.NullOrUndefined (RoleArn) } ) -> Rule
newRule'  customize = (Rule <<< customize) { "Arn": (NullOrUndefined Nothing), "Description": (NullOrUndefined Nothing), "EventPattern": (NullOrUndefined Nothing), "Name": (NullOrUndefined Nothing), "RoleArn": (NullOrUndefined Nothing), "ScheduleExpression": (NullOrUndefined Nothing), "State": (NullOrUndefined Nothing) }



newtype RuleArn = RuleArn String
derive instance newtypeRuleArn :: Newtype RuleArn _
derive instance repGenericRuleArn :: Generic RuleArn _
instance showRuleArn :: Show RuleArn where
  show = genericShow
instance decodeRuleArn :: Decode RuleArn where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRuleArn :: Encode RuleArn where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype RuleDescription = RuleDescription String
derive instance newtypeRuleDescription :: Newtype RuleDescription _
derive instance repGenericRuleDescription :: Generic RuleDescription _
instance showRuleDescription :: Show RuleDescription where
  show = genericShow
instance decodeRuleDescription :: Decode RuleDescription where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRuleDescription :: Encode RuleDescription where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype RuleName = RuleName String
derive instance newtypeRuleName :: Newtype RuleName _
derive instance repGenericRuleName :: Generic RuleName _
instance showRuleName :: Show RuleName where
  show = genericShow
instance decodeRuleName :: Decode RuleName where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRuleName :: Encode RuleName where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype RuleNameList = RuleNameList (Array RuleName)
derive instance newtypeRuleNameList :: Newtype RuleNameList _
derive instance repGenericRuleNameList :: Generic RuleNameList _
instance showRuleNameList :: Show RuleNameList where
  show = genericShow
instance decodeRuleNameList :: Decode RuleNameList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRuleNameList :: Encode RuleNameList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype RuleResponseList = RuleResponseList (Array Rule)
derive instance newtypeRuleResponseList :: Newtype RuleResponseList _
derive instance repGenericRuleResponseList :: Generic RuleResponseList _
instance showRuleResponseList :: Show RuleResponseList where
  show = genericShow
instance decodeRuleResponseList :: Decode RuleResponseList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRuleResponseList :: Encode RuleResponseList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype RuleState = RuleState String
derive instance newtypeRuleState :: Newtype RuleState _
derive instance repGenericRuleState :: Generic RuleState _
instance showRuleState :: Show RuleState where
  show = genericShow
instance decodeRuleState :: Decode RuleState where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRuleState :: Encode RuleState where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>This parameter contains the criteria (either InstanceIds or a tag) used to specify which EC2 instances are to be sent the command. </p>
newtype RunCommandParameters = RunCommandParameters 
  { "RunCommandTargets" :: (RunCommandTargets)
  }
derive instance newtypeRunCommandParameters :: Newtype RunCommandParameters _
derive instance repGenericRunCommandParameters :: Generic RunCommandParameters _
instance showRunCommandParameters :: Show RunCommandParameters where
  show = genericShow
instance decodeRunCommandParameters :: Decode RunCommandParameters where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRunCommandParameters :: Encode RunCommandParameters where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs RunCommandParameters from required parameters
newRunCommandParameters :: RunCommandTargets -> RunCommandParameters
newRunCommandParameters _RunCommandTargets = RunCommandParameters { "RunCommandTargets": _RunCommandTargets }

-- | Constructs RunCommandParameters's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRunCommandParameters' :: RunCommandTargets -> ( { "RunCommandTargets" :: (RunCommandTargets) } -> {"RunCommandTargets" :: (RunCommandTargets) } ) -> RunCommandParameters
newRunCommandParameters' _RunCommandTargets customize = (RunCommandParameters <<< customize) { "RunCommandTargets": _RunCommandTargets }



-- | <p>Information about the EC2 instances that are to be sent the command, specified as key-value pairs. Each <code>RunCommandTarget</code> block can include only one key, but this key may specify multiple values.</p>
newtype RunCommandTarget = RunCommandTarget 
  { "Key" :: (RunCommandTargetKey)
  , "Values" :: (RunCommandTargetValues)
  }
derive instance newtypeRunCommandTarget :: Newtype RunCommandTarget _
derive instance repGenericRunCommandTarget :: Generic RunCommandTarget _
instance showRunCommandTarget :: Show RunCommandTarget where
  show = genericShow
instance decodeRunCommandTarget :: Decode RunCommandTarget where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRunCommandTarget :: Encode RunCommandTarget where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs RunCommandTarget from required parameters
newRunCommandTarget :: RunCommandTargetKey -> RunCommandTargetValues -> RunCommandTarget
newRunCommandTarget _Key _Values = RunCommandTarget { "Key": _Key, "Values": _Values }

-- | Constructs RunCommandTarget's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newRunCommandTarget' :: RunCommandTargetKey -> RunCommandTargetValues -> ( { "Key" :: (RunCommandTargetKey) , "Values" :: (RunCommandTargetValues) } -> {"Key" :: (RunCommandTargetKey) , "Values" :: (RunCommandTargetValues) } ) -> RunCommandTarget
newRunCommandTarget' _Key _Values customize = (RunCommandTarget <<< customize) { "Key": _Key, "Values": _Values }



newtype RunCommandTargetKey = RunCommandTargetKey String
derive instance newtypeRunCommandTargetKey :: Newtype RunCommandTargetKey _
derive instance repGenericRunCommandTargetKey :: Generic RunCommandTargetKey _
instance showRunCommandTargetKey :: Show RunCommandTargetKey where
  show = genericShow
instance decodeRunCommandTargetKey :: Decode RunCommandTargetKey where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRunCommandTargetKey :: Encode RunCommandTargetKey where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype RunCommandTargetValue = RunCommandTargetValue String
derive instance newtypeRunCommandTargetValue :: Newtype RunCommandTargetValue _
derive instance repGenericRunCommandTargetValue :: Generic RunCommandTargetValue _
instance showRunCommandTargetValue :: Show RunCommandTargetValue where
  show = genericShow
instance decodeRunCommandTargetValue :: Decode RunCommandTargetValue where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRunCommandTargetValue :: Encode RunCommandTargetValue where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype RunCommandTargetValues = RunCommandTargetValues (Array RunCommandTargetValue)
derive instance newtypeRunCommandTargetValues :: Newtype RunCommandTargetValues _
derive instance repGenericRunCommandTargetValues :: Generic RunCommandTargetValues _
instance showRunCommandTargetValues :: Show RunCommandTargetValues where
  show = genericShow
instance decodeRunCommandTargetValues :: Decode RunCommandTargetValues where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRunCommandTargetValues :: Encode RunCommandTargetValues where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype RunCommandTargets = RunCommandTargets (Array RunCommandTarget)
derive instance newtypeRunCommandTargets :: Newtype RunCommandTargets _
derive instance repGenericRunCommandTargets :: Generic RunCommandTargets _
instance showRunCommandTargets :: Show RunCommandTargets where
  show = genericShow
instance decodeRunCommandTargets :: Decode RunCommandTargets where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeRunCommandTargets :: Encode RunCommandTargets where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype ScheduleExpression = ScheduleExpression String
derive instance newtypeScheduleExpression :: Newtype ScheduleExpression _
derive instance repGenericScheduleExpression :: Generic ScheduleExpression _
instance showScheduleExpression :: Show ScheduleExpression where
  show = genericShow
instance decodeScheduleExpression :: Decode ScheduleExpression where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeScheduleExpression :: Encode ScheduleExpression where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype StatementId = StatementId String
derive instance newtypeStatementId :: Newtype StatementId _
derive instance repGenericStatementId :: Generic StatementId _
instance showStatementId :: Show StatementId where
  show = genericShow
instance decodeStatementId :: Decode StatementId where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeStatementId :: Encode StatementId where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



-- | <p>Targets are the resources to be invoked when a rule is triggered. Target types include EC2 instances, AWS Lambda functions, Amazon Kinesis streams, Amazon ECS tasks, AWS Step Functions state machines, Run Command, and built-in targets.</p>
newtype Target = Target 
  { "Id" :: (TargetId)
  , "Arn" :: (TargetArn)
  , "RoleArn" :: NullOrUndefined.NullOrUndefined (RoleArn)
  , "Input" :: NullOrUndefined.NullOrUndefined (TargetInput)
  , "InputPath" :: NullOrUndefined.NullOrUndefined (TargetInputPath)
  , "InputTransformer" :: NullOrUndefined.NullOrUndefined (InputTransformer)
  , "KinesisParameters" :: NullOrUndefined.NullOrUndefined (KinesisParameters)
  , "RunCommandParameters" :: NullOrUndefined.NullOrUndefined (RunCommandParameters)
  , "EcsParameters" :: NullOrUndefined.NullOrUndefined (EcsParameters)
  , "BatchParameters" :: NullOrUndefined.NullOrUndefined (BatchParameters)
  }
derive instance newtypeTarget :: Newtype Target _
derive instance repGenericTarget :: Generic Target _
instance showTarget :: Show Target where
  show = genericShow
instance decodeTarget :: Decode Target where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTarget :: Encode Target where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs Target from required parameters
newTarget :: TargetArn -> TargetId -> Target
newTarget _Arn _Id = Target { "Arn": _Arn, "Id": _Id, "BatchParameters": (NullOrUndefined Nothing), "EcsParameters": (NullOrUndefined Nothing), "Input": (NullOrUndefined Nothing), "InputPath": (NullOrUndefined Nothing), "InputTransformer": (NullOrUndefined Nothing), "KinesisParameters": (NullOrUndefined Nothing), "RoleArn": (NullOrUndefined Nothing), "RunCommandParameters": (NullOrUndefined Nothing) }

-- | Constructs Target's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTarget' :: TargetArn -> TargetId -> ( { "Id" :: (TargetId) , "Arn" :: (TargetArn) , "RoleArn" :: NullOrUndefined.NullOrUndefined (RoleArn) , "Input" :: NullOrUndefined.NullOrUndefined (TargetInput) , "InputPath" :: NullOrUndefined.NullOrUndefined (TargetInputPath) , "InputTransformer" :: NullOrUndefined.NullOrUndefined (InputTransformer) , "KinesisParameters" :: NullOrUndefined.NullOrUndefined (KinesisParameters) , "RunCommandParameters" :: NullOrUndefined.NullOrUndefined (RunCommandParameters) , "EcsParameters" :: NullOrUndefined.NullOrUndefined (EcsParameters) , "BatchParameters" :: NullOrUndefined.NullOrUndefined (BatchParameters) } -> {"Id" :: (TargetId) , "Arn" :: (TargetArn) , "RoleArn" :: NullOrUndefined.NullOrUndefined (RoleArn) , "Input" :: NullOrUndefined.NullOrUndefined (TargetInput) , "InputPath" :: NullOrUndefined.NullOrUndefined (TargetInputPath) , "InputTransformer" :: NullOrUndefined.NullOrUndefined (InputTransformer) , "KinesisParameters" :: NullOrUndefined.NullOrUndefined (KinesisParameters) , "RunCommandParameters" :: NullOrUndefined.NullOrUndefined (RunCommandParameters) , "EcsParameters" :: NullOrUndefined.NullOrUndefined (EcsParameters) , "BatchParameters" :: NullOrUndefined.NullOrUndefined (BatchParameters) } ) -> Target
newTarget' _Arn _Id customize = (Target <<< customize) { "Arn": _Arn, "Id": _Id, "BatchParameters": (NullOrUndefined Nothing), "EcsParameters": (NullOrUndefined Nothing), "Input": (NullOrUndefined Nothing), "InputPath": (NullOrUndefined Nothing), "InputTransformer": (NullOrUndefined Nothing), "KinesisParameters": (NullOrUndefined Nothing), "RoleArn": (NullOrUndefined Nothing), "RunCommandParameters": (NullOrUndefined Nothing) }



newtype TargetArn = TargetArn String
derive instance newtypeTargetArn :: Newtype TargetArn _
derive instance repGenericTargetArn :: Generic TargetArn _
instance showTargetArn :: Show TargetArn where
  show = genericShow
instance decodeTargetArn :: Decode TargetArn where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTargetArn :: Encode TargetArn where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype TargetId = TargetId String
derive instance newtypeTargetId :: Newtype TargetId _
derive instance repGenericTargetId :: Generic TargetId _
instance showTargetId :: Show TargetId where
  show = genericShow
instance decodeTargetId :: Decode TargetId where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTargetId :: Encode TargetId where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype TargetIdList = TargetIdList (Array TargetId)
derive instance newtypeTargetIdList :: Newtype TargetIdList _
derive instance repGenericTargetIdList :: Generic TargetIdList _
instance showTargetIdList :: Show TargetIdList where
  show = genericShow
instance decodeTargetIdList :: Decode TargetIdList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTargetIdList :: Encode TargetIdList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype TargetInput = TargetInput String
derive instance newtypeTargetInput :: Newtype TargetInput _
derive instance repGenericTargetInput :: Generic TargetInput _
instance showTargetInput :: Show TargetInput where
  show = genericShow
instance decodeTargetInput :: Decode TargetInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTargetInput :: Encode TargetInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype TargetInputPath = TargetInputPath String
derive instance newtypeTargetInputPath :: Newtype TargetInputPath _
derive instance repGenericTargetInputPath :: Generic TargetInputPath _
instance showTargetInputPath :: Show TargetInputPath where
  show = genericShow
instance decodeTargetInputPath :: Decode TargetInputPath where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTargetInputPath :: Encode TargetInputPath where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype TargetList = TargetList (Array Target)
derive instance newtypeTargetList :: Newtype TargetList _
derive instance repGenericTargetList :: Generic TargetList _
instance showTargetList :: Show TargetList where
  show = genericShow
instance decodeTargetList :: Decode TargetList where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTargetList :: Encode TargetList where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype TargetPartitionKeyPath = TargetPartitionKeyPath String
derive instance newtypeTargetPartitionKeyPath :: Newtype TargetPartitionKeyPath _
derive instance repGenericTargetPartitionKeyPath :: Generic TargetPartitionKeyPath _
instance showTargetPartitionKeyPath :: Show TargetPartitionKeyPath where
  show = genericShow
instance decodeTargetPartitionKeyPath :: Decode TargetPartitionKeyPath where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTargetPartitionKeyPath :: Encode TargetPartitionKeyPath where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype TestEventPatternRequest = TestEventPatternRequest 
  { "EventPattern" :: (EventPattern)
  , "Event" :: (String)
  }
derive instance newtypeTestEventPatternRequest :: Newtype TestEventPatternRequest _
derive instance repGenericTestEventPatternRequest :: Generic TestEventPatternRequest _
instance showTestEventPatternRequest :: Show TestEventPatternRequest where
  show = genericShow
instance decodeTestEventPatternRequest :: Decode TestEventPatternRequest where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTestEventPatternRequest :: Encode TestEventPatternRequest where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs TestEventPatternRequest from required parameters
newTestEventPatternRequest :: String -> EventPattern -> TestEventPatternRequest
newTestEventPatternRequest _Event _EventPattern = TestEventPatternRequest { "Event": _Event, "EventPattern": _EventPattern }

-- | Constructs TestEventPatternRequest's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTestEventPatternRequest' :: String -> EventPattern -> ( { "EventPattern" :: (EventPattern) , "Event" :: (String) } -> {"EventPattern" :: (EventPattern) , "Event" :: (String) } ) -> TestEventPatternRequest
newTestEventPatternRequest' _Event _EventPattern customize = (TestEventPatternRequest <<< customize) { "Event": _Event, "EventPattern": _EventPattern }



newtype TestEventPatternResponse = TestEventPatternResponse 
  { "Result" :: NullOrUndefined.NullOrUndefined (Boolean)
  }
derive instance newtypeTestEventPatternResponse :: Newtype TestEventPatternResponse _
derive instance repGenericTestEventPatternResponse :: Generic TestEventPatternResponse _
instance showTestEventPatternResponse :: Show TestEventPatternResponse where
  show = genericShow
instance decodeTestEventPatternResponse :: Decode TestEventPatternResponse where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTestEventPatternResponse :: Encode TestEventPatternResponse where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

-- | Constructs TestEventPatternResponse from required parameters
newTestEventPatternResponse :: TestEventPatternResponse
newTestEventPatternResponse  = TestEventPatternResponse { "Result": (NullOrUndefined Nothing) }

-- | Constructs TestEventPatternResponse's fields from required parameters
--   This may be useful if you need to immediately overwrite some of the optional values
newTestEventPatternResponse' :: ( { "Result" :: NullOrUndefined.NullOrUndefined (Boolean) } -> {"Result" :: NullOrUndefined.NullOrUndefined (Boolean) } ) -> TestEventPatternResponse
newTestEventPatternResponse'  customize = (TestEventPatternResponse <<< customize) { "Result": (NullOrUndefined Nothing) }



newtype TransformerInput = TransformerInput String
derive instance newtypeTransformerInput :: Newtype TransformerInput _
derive instance repGenericTransformerInput :: Generic TransformerInput _
instance showTransformerInput :: Show TransformerInput where
  show = genericShow
instance decodeTransformerInput :: Decode TransformerInput where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTransformerInput :: Encode TransformerInput where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }



newtype TransformerPaths = TransformerPaths (StrMap.StrMap TargetInputPath)
derive instance newtypeTransformerPaths :: Newtype TransformerPaths _
derive instance repGenericTransformerPaths :: Generic TransformerPaths _
instance showTransformerPaths :: Show TransformerPaths where
  show = genericShow
instance decodeTransformerPaths :: Decode TransformerPaths where
  decode = genericDecode $ defaultOptions { unwrapSingleConstructors = true }
instance encodeTransformerPaths :: Encode TransformerPaths where
  encode = genericEncode $ defaultOptions { unwrapSingleConstructors = true }

