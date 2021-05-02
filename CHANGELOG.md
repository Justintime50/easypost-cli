# EasyPost CLI Changelog

## v1.4.0 (2021-05-02)

* Adds `shipment_invoice` report functionality
* Corrects comments about reports
* Replaces `declare` with `type` on the command router which fixes POSIX compatibility
* Only accept a single paremeter (command) instead of many

## v1.3.3 (2021-03-01)

* Adds missing USPS carrier account ID environment variable to one-call buy a USPS stamp
* Adds documentation surrounding buying USPS stamps

## v1.3.2 (2021-03-01)

* Fixed a bug where shipments couldn't be created properly as the address and parcel objects weren't encaspulated correctly in the request

## v1.3.1 (2021-03-01)

* Fixed a bug where stamps couldn't be bought due to missing service

## v1.3.0 (2021-01-25)

* Adds `buy_stamp` as a feature. Now you can purchase USPS stamps right on the command line!
* Fixes a bad reference to `create_return` which was unusable before with a duplicate function name of `create_refund`

## v1.2.1 (2021-01-07)

* Switching from Travis-CI to GitHub Actions
* Using `homebrew-releaser` for automated releasing
* Small documentation updates

## v1.2.0 (2020-10-09)

* Further bringing the Unix and Windows build process and executables in-line with each other. There is now only a single file difference which has mostly been unified. In a coming version, we'll be able to combine these into a single shell file and convert it to Batch during the build process like all other functionality
* Fixed the broken Windows executable
* Added a main function which helps encapsulate each invokaction of the CLI tool
* Refactored utils and code location to be more streamlined - rebuilt executables to take advantage of these changes

## v1.1.0 (2020-10-05)

* We now properly throw an error when a config file is not found (closes #12)
* Bringing the Windows executable in-line with the shell executable by populating missing code and making the init/router logic uniform
* Removing additional overhead in the build process by doing more code reuse, removing unused code, renaming files and relocating them
* Wrapping all code inside a function to ensure encapsulation, sepration of concerns, and code-reuse. This was done both in the tool and all the utilities to build it (closes #14)

## v1.0.0 (2020-09-15)

* Major code refactor removing various overhead
* Streamlined build and release flow and tools
* Added additional missing linting
* Added the ability to retrieve an order
* Updated all documentation

## v1.0.0-beta (2020)
- Added automated installer/uninstaller
- Added creation of addresses, insurance, parcels, shipments, trackers, pickups, batches, webhooks, and more
- Added retrieval of addresses, insurance, parcels, shipments, trackers, pickups, batches, webhooks, api_keys, users, and more
- Added buy and refund shipment along with regenerating rates
- Added Travis CI Shellcheck testing
- Added complete user and developer documentation
- Added executable build script for deployment
- Added manual unit tests
