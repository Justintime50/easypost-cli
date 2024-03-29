# EasyPost CLI Docs

The EasyPost CLI allows a user to interact with the EasyPost API without needing to build a custom solution - all from the command line.

## Usage

All EasyPost CLI commands use the syntax `ep mycommand`. Each available command can be found below.

### EasyPost CLI Specific Commands

- If you'd like to view these docs, run `ep help`.
- View the version info by running `ep version`.

### Addresses

#### Create an Address

Create an address. You will be prompted for the address details. The accompanying generated ID can be used to reference this address later. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#create-and-verify-addresses).

```bash
ep create_address
```

#### Retrieve an Address

Retrieve an address record. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-an-address).

```bash
ep retrieve_address
```

#### Retrieve a list of Addresses

Retrieve a list of addresses.

```bash
ep retrieve_addresses
```

### Batches

#### Add Shipments to a Batch

Add a shipment to a batch. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#add-shipments-to-a-batch).

```bash
ep add_shipment_to_batch
```

#### Create a Batch

Create an empty batch object that shipments can be added to later. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#create-a-batch).

```bash
ep add_shipment_to_batch
```

#### Generate a Batch Label

Generate a label for a batch of shipments. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#batch-labels).

```bash
ep create_batch
```

#### Remove Shipments from a Batch

Remove a shipment from a batch. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#remove-shipments-from-a-batch).

```bash
ep remove_shipment_from_batch
```

### Insurance

#### Create Insurance

Create insurance for a non-EasyPost shipment. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#create-an-insurance).

```bash
ep create_insurance
```

#### Retrieve an Insurance Record

Retrieve a single insurance record. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-an-insurance).

```bash
ep retrieve_insurance
```

#### Retrieve a list of Insurances

Retrieve a single insurance record. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-list-of-insurances).

```bash
ep retrieve_insurances
```

### Orders

#### Retrieve an Order Record

Retrieve a single order record. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-an-order).

```bash
ep retrieve_order
```

### Parcels

#### Create a Parcel

Create a parcel to use for later. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#create-a-parcel).

```bash
ep create_parcel
```

#### Retrieve a Parcel

Retrieve a single parcel. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-parcel).

```bash
ep retrieve_parcel
```

### Pickups

#### Buy a Pickup

Buy a pickup. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#buy-a-pickup).

```bash
ep buy_pickup
```

#### Cancel a Pickup

Cancel a pickup. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#cancel-a-pickup).

```bash
ep cancel_pickup
```

#### Create a Pickup

Create a pickup. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#create-a-pickup).

```bash
ep create_pickup
```

#### Retrieve a Pickup

Retrieve a pickup. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-pickup).

```bash
ep retrieve_pickup
```

### Reports

#### Create a Report

Create a report based on type. Provide the report type and a start date and end date for the report when prompted. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#create-a-report).

```bash
ep create_report
```

#### Retrieve a list of Reports

Retrieve a list of reports based on type. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-list-of-reports).

```bash
ep retrieve_reports
```

#### Retrieve a Report

Retrieve a report based on report type. Provide an ID for the report you want to retrieve when prompted. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-report).

```bash
ep retrieve_report
```

### Scanforms

#### Manifest a Batch

Generate a manifest for a batch. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#manifesting-scan-form).

```bash
ep manifest_batch
```

#### Retrieve a Scanform

Retrieve a single scanform. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-scanform).

```bash
ep retrieve_scanform
```

#### Retrieve a List of Scanforms

Retrieve a list of scanforms. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-list-of-scanforms).

```bash
ep retrieve_scanforms
```

### Shipments

#### Buy a Shipment

Provide the shipment ID and rate ID to purchase a label. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#buy-a-shipment).

```bash
ep buy_shipment
```

#### Buy a USPS Stamp

Buy a single USPS domestic stamp that prints onto a #10 standard envelope.

```bash
ep buy_stamp
```

To do this, you'll need to configure an additional environment variable:

```bash
# macOS and Linux
echo "USPS_CARRIER_ACCOUNT_ID=ca_123..." >> ~/.easypost-cli-config

# Windows
@echo set USPS_CARRIER_ACCOUNT_ID=ca_123... >> C:/easypost-cli/easypost-cli-config.bat
```

#### Create a Return

Create a return shipment that swaps the to and from addresses on the label.

```bash
ep create_return
```

#### Create a Shipment

Create a shipment and have rates returned for all configured carriers. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#create-a-shipment).

```bash
ep create_shipment
```

#### Refund a Shipment

Provide the shipment ID to refund the payment. This can take upwards of 15 days to process. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#refund-a-shipment).

```bash
ep refund_shipment
```

#### Regenerate Rates

Regenerate rates for a shipment. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#regenerate-rates-for-a-shipment).

```bash
ep regenerate_rates
```

#### Retrieve a Shipment

Retrieve a shipment. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-shipment).

```bash
ep retrieve_shipment
```

#### Retrieve a list of Shipments

Retrieve a list of shipments. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-list-of-shipments).

```bash
ep retrieve_shipments
```

#### Retrieve a Shipment's SmartRates

Retrieve a shipment's smartrates. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#smartrate-retrieve_time_in_transit_statistics-codesample).

```bash
ep retrieve_smartrates
```

### Trackers

#### Create a Tracker

Create a tracker for a shipment you've created. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#create-a-tracker).

```bash
ep create_tracker
```

#### Retrieve a Tracker

Retrieve a single tracker. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-tracker).

```bash
ep retrieve_tracker
```

#### Retrieve a list of Trackers

Retrieve a single tracker. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-list-of-trackers).

```bash
ep retrieve_trackers
```

### Users

#### Create a Child User

Create a child user under the configured parent account. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#child-users).

```bash
ep create_child_user
```

#### Retrieve a list of API Keys

Retrieve test and production API keys for an account. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-an-api-key).

```bash
ep retrieve_api_keys
```

#### Retrieve a Carrier Account

Retrieve a list of all configured carrier accounts for the configured user. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-carrieraccount).

```bash
ep retrieve_carrier_account
```

#### Retrieve a list of Carrier Accounts

Retrieve a list of all configured carrier accounts for the configured user. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#list-all-carrier-accounts).

```bash
ep retrieve_carrier_accounts
```

#### Retrieve a list of Carrier Types

Retrieve the list of all carrier types available to the account of the given API key. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-available-carrier-types).

```bash
ep retrieve_carrier_types
```

#### Retrieve Users

Retrieve a single user. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-user).

```bash
ep retrieve_user
```

#### Retrieve a list of Users

Retrieve a list of users for the configured account.

```bash
ep retrieve_users
```

### Webhooks

#### Create a Webhook

Create a webhook with a URL endpoint. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#create-a-webhook).

```bash
ep create_webhook
```

#### Delete a Webhook

Delete a webhook by ID. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#delete-a-webhook).

```bash
ep delete_webhook
```

#### Retrieve a Webhook

Retrieve a single webhook. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#retrieve-a-webhook).

```bash
ep retrieve_webhook
```

#### Retrieve a list of Webhooks

Retrieve a list of webhooks. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#list-a-webhooks).

```bash
ep retrieve_webhooks
```

#### Update a Webhook

Enables a Webhook that has been disabled. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api#update-a-webhook).

```bash
ep update_webhook
```
