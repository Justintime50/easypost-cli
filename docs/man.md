# EasyPost CLI Docs

The EasyPost CLI allows a user to interact with the EasyPost API without needing to build a custom solution - all from the command line.

## Usage

All EasyPost CLI commands use the syntax `ep mycommand`. Each available command can be found below, broken up by endpoint type.

### EasyPost CLI Specific Commands

- If you'd like to view these docs, run `ep help`. 
- View the version info by running `ep version`.
- Update your API key by running `ep update-api-key`.

### Account Management

**Create a Child User**

Create a child user under the configured parent account. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#child-users).

```bash
ep create-child-user
```

**Retrieve a list of API Keys**

Retrieve test and production API keys for an account. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-an-api-key).

```bash
ep retrieve-api-keys
```

**Retrieve a Carrier Account**

Retrieve a list of all configured carrier accounts for the configured user. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-a-carrieraccount).

```bash
ep retrieve-carrier-account
```

**Retrieve a list of Carrier Accounts**

Retrieve a list of all configured carrier accounts for the configured user. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#list-all-carrier-accounts).

```bash
ep retrieve-carrier-accounts
```

**Retrieve a list of Carrier Types**

Retrieve the list of all carrier types available to the account of the given API key. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-available-carrier-types).

```bash
ep retrieve-carrier-types
```

**Retrieve Users**

Retrieve a single user. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-a-user).

```bash
ep retrieve-user
```

**Retrieve a list of Users**

Retrieve a list of users for the configured account.

```bash
ep retrieve-users
```

### Addresses

**Create an Address**

Create an address. You will be prompted for the address details. The accompanying generated ID can be used to reference this address later. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#create-and-verify-addresses).

```bash
ep create-address
```

**Retrieve an Address**

Retrieve an address record. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-an-address).

```bash
ep retrieve-address
```

**Retrieve a list of Addresses**

Retrieve a list of addresses.

```bash
ep retrieve-addresses
```

### Billing

**Buy a Shipment**

Provide the shipment ID and rate ID to purchase a label. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#buy-a-shipment).

```bash
ep buy-shipment
```

**Refund a Shipment**

Provide the shipment ID to refund the payment. This can take upwards of 15 days to process. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#refund-a-shipment).

```bash
ep refund-shipment
```

**Regenerate Rates**

Regenerate rates for a shipment. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#regenerate-rates-for-a-shipment).

```bash
ep regenerate-rates
```

### Insurance

**Create Insurance**

Create insurance for a non-EasyPost shipment. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#create-an-insurance).

```bash
ep create-insurance
```

**Retrieve an Insurance Record**

Retrieve a single insurance record. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-an-insurance).

```bash
ep retrieve-insurance
```

**Retrieve a list of Insurances**

Retrieve a single insurance record. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-a-list-of-insurances).

```bash
ep retrieve-insurances
```

### Parcels

**Create a Parcel**

Create a parcel to use for later. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#create-a-parcel).

```bash
ep create-parcel
```

**Retrieve a Parcel**

Retrieve a single parcel. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-a-parcel).

```bash
ep retrieve-parcel
```

**Retrieve a list of Parcels**

Retrieve a single parcel.

```bash
ep retrieve-parcels
```

### Reports

**Create a Report**

Create a report based on type. Provide a start date and end date for the report when prompted. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#create-a-report).

```bash
# Available options:
ep create-payment-log-report
ep create-refund-report
ep create-shipment-report
ep create-tracker-report
```

**Retrieve a list of Reports**

Retrieve a list of reports based on type. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-a-list-of-reports).

```bash
# Available options:
ep retrieve-payment-log-reports
ep retrieve-refund-reports
ep retrieve-shipment-reports
ep retrieve-tracker-reports
```

**Retrieve a Report**

Retrieve a report based on report type. Provide an ID for the report you want to retrieve when prompted. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-a-report).

```bash
# Available options:
ep retrieve-payment-log-report
ep retrieve-refund-report
ep retrieve-shipment-report
ep retrieve-tracker-report
```

### Shipments

**Create a Return**

Create a return shipment that swaps the to and from addresses on the label.

```bash
ep create-return
```

**Create a Shipment**

Create a shipment and have rates returned for all configured carriers. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#create-a-shipment).

```bash
ep create-shipment
```

**Retrieve a Shipment**

Retrieve a shipment. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-a-shipment).

```bash
ep retrieve-shipment
```

**Retrieve a list of Shipments**

Retrieve a list of shipments. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-a-list-of-shipments).

```bash
ep retrieve-shipments
```

### Trackers

**Create a Tracker**

Create a tracker for a shipment you've created. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#create-a-tracker).

```bash
ep create-tracker
```

**Retrieve a Tracker**

Retrieve a single tracker. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-a-tracker).

```bash
ep retrieve-tracker
```

**Retrieve a list of Trackers**

Retrieve a single tracker. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-a-list-of-trackers).

```bash
ep retrieve-trackers
```

### Webhooks

**Create a Webhook**

Create a webhook with a URL endpoint. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#create-a-webhook).

```bash
ep create-webhook
```

**Delete a Webhook**

Delete a webhook by ID. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#delete-a-webhook).

```bash
ep delete-webhook
```

**Retrieve a Webhook**

Retrieve a single webhook. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#retrieve-a-webhook).

```bash
ep retrieve-webhook
```

**Retrieve a list of Webhooks**

Retrieve a list of webhooks. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#list-a-webhooks).

```bash
ep retrieve-webhooks
```

**Update a Webhook**

Enables a Webhook that has been disabled. [EasyPost docs for this endpoint](https://www.easypost.com/docs/api/curl#update-a-webhook).

```bash
ep update-webhook
```

## Features that Will Not Be Supported

There are a few EasyPost API endpoints that will not be supported here. They are listed below:

- Creating a Carrier Account (too many options to provide comprehensive coverage)
