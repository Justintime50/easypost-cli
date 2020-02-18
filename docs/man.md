# EasyPost CLI Docs

The EasyPost CLI allows a user to interact with the EasyPost API without needing to build our an application.

## Usage

All EasyPost CLI commands use the syntax `ep mycommand`. 

### Misc

- If you'd like to view these docs, run `ep help`. 
- View the version info by running `ep version`.
- Update your API key by running `ep update-api-key`.

### Account Management

**Retrieve API Keys**

Retrieve test and production API keys for an account.

```bash
ep retrieve-api-keys
```

**Retrieve Users**

Retrieve a specified user.

```bash
ep retrieve-user
```

**Retrieve Users**

Retrieve all users for an account.

```bash
ep retrieve-users
```

### Billing

**Buy a Shipment**

Provide the shipment ID and rate ID to purchase a label.

```bash
ep buy-shipment
```

**Refund a Shipment**

Provide the shipment ID to refund the payment.

```bash
ep refund-shipment
```

**Regenerate Rates**

Regenerate rates for a shipment.

```bash
ep regenerate-rates
```

### Create

**Create an Address**

Create an address to use for later.

```bash
ep create-address
```

**Create Insurance**

Create insurance for a non-EasyPost shipment.

```bash
ep create-insurance
```

**Create a Parcel**

Create a parcel to use for later.

```bash
ep create-parcel
```

**Create a Return**

Create a return shipment that swaps the to and from addresses on the label.

```bash
ep create-return
```

**Create a Shipment**

Create a shipment and have rates returned for all configured carriers.

```bash
ep create-shipment
```

**Create a Tracker**

Create a tracker for a shipment you've created.

```bash
ep create-address
```

### Retrieve

**Retrieve an Address**

Retrieve a single address.

```bash
ep retrieve-address
```

**Retrieve Insurance**

Retrieve a single insurance record.

```bash
ep retrieve-insurance
```

**Retrieve a Parcel**

Retrieve a single parcel.

```bash
ep retrieve-parcel
```

**Retrieve a Shipment**

Retrieve a single shipment.

```bash
ep retrieve-shipment
```

**Retrieve a Tracker**

Retrieve a single tracker.

```bash
ep retrieve-tracker
```
