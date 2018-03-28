
module AWS.CloudWatchEvents.Requests where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Eff.Exception (EXCEPTION)

import AWS.Request (MethodName(..), request) as AWS
import AWS.Request.Types as Types

import AWS.CloudWatchEvents as CloudWatchEvents
import AWS.CloudWatchEvents.Types as CloudWatchEventsTypes


-- | <p>Deletes the specified rule.</p> <p>You must remove all targets from a rule using <a>RemoveTargets</a> before you can delete the rule.</p> <p>When you delete a rule, incoming events might continue to match to the deleted rule. Please allow a short period of time for changes to take effect.</p>
deleteRule :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.DeleteRuleRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
deleteRule (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "deleteRule"


-- | <p>Displays the external AWS accounts that are permitted to write events to your account using your account's event bus, and the associated policy. To enable your account to receive events from other accounts, use <a>PutPermission</a>.</p>
describeEventBus :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.DescribeEventBusRequest -> Aff (exception :: EXCEPTION | eff) CloudWatchEventsTypes.DescribeEventBusResponse
describeEventBus (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "describeEventBus"


-- | <p>Describes the specified rule.</p>
describeRule :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.DescribeRuleRequest -> Aff (exception :: EXCEPTION | eff) CloudWatchEventsTypes.DescribeRuleResponse
describeRule (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "describeRule"


-- | <p>Disables the specified rule. A disabled rule won't match any events, and won't self-trigger if it has a schedule expression.</p> <p>When you disable a rule, incoming events might continue to match to the disabled rule. Please allow a short period of time for changes to take effect.</p>
disableRule :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.DisableRuleRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
disableRule (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "disableRule"


-- | <p>Enables the specified rule. If the rule does not exist, the operation fails.</p> <p>When you enable a rule, incoming events might not immediately start matching to a newly enabled rule. Please allow a short period of time for changes to take effect.</p>
enableRule :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.EnableRuleRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
enableRule (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "enableRule"


-- | <p>Lists the rules for the specified target. You can see which of the rules in Amazon CloudWatch Events can invoke a specific target in your account.</p>
listRuleNamesByTarget :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.ListRuleNamesByTargetRequest -> Aff (exception :: EXCEPTION | eff) CloudWatchEventsTypes.ListRuleNamesByTargetResponse
listRuleNamesByTarget (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "listRuleNamesByTarget"


-- | <p>Lists your Amazon CloudWatch Events rules. You can either list all the rules or you can provide a prefix to match to the rule names.</p>
listRules :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.ListRulesRequest -> Aff (exception :: EXCEPTION | eff) CloudWatchEventsTypes.ListRulesResponse
listRules (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "listRules"


-- | <p>Lists the targets assigned to the specified rule.</p>
listTargetsByRule :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.ListTargetsByRuleRequest -> Aff (exception :: EXCEPTION | eff) CloudWatchEventsTypes.ListTargetsByRuleResponse
listTargetsByRule (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "listTargetsByRule"


-- | <p>Sends custom events to Amazon CloudWatch Events so that they can be matched to rules.</p>
putEvents :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.PutEventsRequest -> Aff (exception :: EXCEPTION | eff) CloudWatchEventsTypes.PutEventsResponse
putEvents (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "putEvents"


-- | <p>Running <code>PutPermission</code> permits the specified AWS account to put events to your account's default <i>event bus</i>. CloudWatch Events rules in your account are triggered by these events arriving to your default event bus. </p> <p>For another account to send events to your account, that external account must have a CloudWatch Events rule with your account's default event bus as a target.</p> <p>To enable multiple AWS accounts to put events to your default event bus, run <code>PutPermission</code> once for each of these accounts.</p> <p>The permission policy on the default event bus cannot exceed 10KB in size.</p>
putPermission :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.PutPermissionRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
putPermission (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "putPermission"


-- | <p>Creates or updates the specified rule. Rules are enabled by default, or based on value of the state. You can disable a rule using <a>DisableRule</a>.</p> <p>If you are updating an existing rule, the rule is completely replaced with what you specify in this <code>PutRule</code> command. If you omit arguments in <code>PutRule</code>, the old values for those arguments are not kept. Instead, they are replaced with null values.</p> <p>When you create or update a rule, incoming events might not immediately start matching to new or updated rules. Please allow a short period of time for changes to take effect.</p> <p>A rule must contain at least an EventPattern or ScheduleExpression. Rules with EventPatterns are triggered when a matching event is observed. Rules with ScheduleExpressions self-trigger based on the given schedule. A rule can have both an EventPattern and a ScheduleExpression, in which case the rule triggers on matching events as well as on a schedule.</p> <p>Most services in AWS treat : or / as the same character in Amazon Resource Names (ARNs). However, CloudWatch Events uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.</p>
putRule :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.PutRuleRequest -> Aff (exception :: EXCEPTION | eff) CloudWatchEventsTypes.PutRuleResponse
putRule (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "putRule"


-- | <p>Adds the specified targets to the specified rule, or updates the targets if they are already associated with the rule.</p> <p>Targets are the resources that are invoked when a rule is triggered.</p> <p>You can configure the following as targets for CloudWatch Events:</p> <ul> <li> <p>EC2 instances</p> </li> <li> <p>AWS Lambda functions</p> </li> <li> <p>Streams in Amazon Kinesis Streams</p> </li> <li> <p>Delivery streams in Amazon Kinesis Firehose</p> </li> <li> <p>Amazon ECS tasks</p> </li> <li> <p>AWS Step Functions state machines</p> </li> <li> <p>AWS Batch jobs</p> </li> <li> <p>Pipelines in Amazon Code Pipeline</p> </li> <li> <p>Amazon Inspector assessment templates</p> </li> <li> <p>Amazon SNS topics</p> </li> <li> <p>Amazon SQS queues</p> </li> <li> <p>The default event bus of another AWS account</p> </li> </ul> <p>Note that creating rules with built-in targets is supported only in the AWS Management Console.</p> <p>For some target types, <code>PutTargets</code> provides target-specific parameters. If the target is an Amazon Kinesis stream, you can optionally specify which shard the event goes to by using the <code>KinesisParameters</code> argument. To invoke a command on multiple EC2 instances with one rule, you can use the <code>RunCommandParameters</code> field.</p> <p>To be able to make API calls against the resources that you own, Amazon CloudWatch Events needs the appropriate permissions. For AWS Lambda and Amazon SNS resources, CloudWatch Events relies on resource-based policies. For EC2 instances, Amazon Kinesis streams, and AWS Step Functions state machines, CloudWatch Events relies on IAM roles that you specify in the <code>RoleARN</code> argument in <code>PutTargets</code>. For more information, see <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/events/auth-and-access-control-cwe.html">Authentication and Access Control</a> in the <i>Amazon CloudWatch Events User Guide</i>.</p> <p>If another AWS account is in the same region and has granted you permission (using <code>PutPermission</code>), you can send events to that account by setting that account's event bus as a target of the rules in your account. To send the matched events to the other account, specify that account's event bus as the <code>Arn</code> when you run <code>PutTargets</code>. If your account sends events to another account, your account is charged for each sent event. Each event sent to antoher account is charged as a custom event. The account receiving the event is not charged. For more information on pricing, see <a href="https://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch Pricing</a>.</p> <p>For more information about enabling cross-account events, see <a>PutPermission</a>.</p> <p> <b>Input</b>, <b>InputPath</b> and <b>InputTransformer</b> are mutually exclusive and optional parameters of a target. When a rule is triggered due to a matched event:</p> <ul> <li> <p>If none of the following arguments are specified for a target, then the entire event is passed to the target in JSON form (unless the target is Amazon EC2 Run Command or Amazon ECS task, in which case nothing from the event is passed to the target).</p> </li> <li> <p>If <b>Input</b> is specified in the form of valid JSON, then the matched event is overridden with this constant.</p> </li> <li> <p>If <b>InputPath</b> is specified in the form of JSONPath (for example, <code>$.detail</code>), then only the part of the event specified in the path is passed to the target (for example, only the detail part of the event is passed).</p> </li> <li> <p>If <b>InputTransformer</b> is specified, then one or more specified JSONPaths are extracted from the event and used as values in a template that you specify as the input to the target.</p> </li> </ul> <p>When you specify <code>InputPath</code> or <code>InputTransformer</code>, you must use JSON dot notation, not bracket notation.</p> <p>When you add targets to a rule and the associated rule triggers soon after, new or updated targets might not be immediately invoked. Please allow a short period of time for changes to take effect.</p> <p>This action can partially fail if too many requests are made at the same time. If that happens, <code>FailedEntryCount</code> is non-zero in the response and each entry in <code>FailedEntries</code> provides the ID of the failed target and the error code.</p>
putTargets :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.PutTargetsRequest -> Aff (exception :: EXCEPTION | eff) CloudWatchEventsTypes.PutTargetsResponse
putTargets (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "putTargets"


-- | <p>Revokes the permission of another AWS account to be able to put events to your default event bus. Specify the account to revoke by the <code>StatementId</code> value that you associated with the account when you granted it permission with <code>PutPermission</code>. You can find the <code>StatementId</code> by using <a>DescribeEventBus</a>.</p>
removePermission :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.RemovePermissionRequest -> Aff (exception :: EXCEPTION | eff) Types.NoOutput
removePermission (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "removePermission"


-- | <p>Removes the specified targets from the specified rule. When the rule is triggered, those targets are no longer be invoked.</p> <p>When you remove a target, when the associated rule triggers, removed targets might continue to be invoked. Please allow a short period of time for changes to take effect.</p> <p>This action can partially fail if too many requests are made at the same time. If that happens, <code>FailedEntryCount</code> is non-zero in the response and each entry in <code>FailedEntries</code> provides the ID of the failed target and the error code.</p>
removeTargets :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.RemoveTargetsRequest -> Aff (exception :: EXCEPTION | eff) CloudWatchEventsTypes.RemoveTargetsResponse
removeTargets (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "removeTargets"


-- | <p>Tests whether the specified event pattern matches the provided event.</p> <p>Most services in AWS treat : or / as the same character in Amazon Resource Names (ARNs). However, CloudWatch Events uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.</p>
testEventPattern :: forall eff. CloudWatchEvents.Service -> CloudWatchEventsTypes.TestEventPatternRequest -> Aff (exception :: EXCEPTION | eff) CloudWatchEventsTypes.TestEventPatternResponse
testEventPattern (CloudWatchEvents.Service serviceImpl) = AWS.request serviceImpl method  where
    method = AWS.MethodName "testEventPattern"
