# EasyPost CLI Docs

The EasyPost CLI allows a user to interact with the EasyPost API without needing to build our an application.

## Usage

All EasyPost CLI commands use the syntax `ep-mycommand`. If you'd like to view these docs from the command line, run `ep-help`.

### Billing

**Buy a Shipment**

Provide the shipment ID and rate ID to purchase a label.

```bash
ep-buy-shipment
```

**Refund a Shipment**

Provide the shipment ID to refund the payment.

```bash
ep-refund-shipment
```

### Create

**Create an Address**

Create an address to use for later.

```bash
ep-create-address
```

**Create a Parcel**

Create a parcel to use for later.

```bash
ep-create-parcel
```

**Create a Shipment**

Create a shipment and have rates returned for all configured carriers.

```bash
ep-create-shipment
```

**Create a Tracker**

Create a tracker for a shipment you've created.

```bash
ep-create-address
```

### Retrieve

**Retrieve an Address**

Retrieve a single address.

```bash
ep-retrieve-address
```

**Retrieve a Parcel**

Retrieve a single parcel.

```bash
ep-retrieve-parcel
```

**Retrieve a Shipment**

Retrieve a single shipment.

```bash
ep-retrieve-shipment
```

**Retrieve a Tracker**

Retrieve a single tracker.

```bash
ep-retrieve-tracker
```
