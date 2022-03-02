select
    azure_web_apps.id,
    azure_subscription_subscriptions.display_name AS subscription_name,
    azure_subscription_subscriptions.id AS subscription_id
from
    azure_web_apps,
    azure_subscription_subscriptions
where
  azure_subscription_subscriptions.subscription_id = azure_web_apps.subscription_id
  and vnet_connection -> 'properties' -> 'vnetResourceId' is null;
