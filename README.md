# Node-red mainflux flows

## Building

### Provision

- create things:
  - http
  - mqtt
- create channels:
  - floor_1
  - floor_2
  - floor_3
- connect every thing with every channel
- in node-red, copy the required ids and keys in `flow.set` node
- in node-red, Edit mqtt out node > `Edit mqtt-broker node` > `Security` and copy `mqtt` thing id and key to Username and Password fields
- in node-red, Edit http request node > `Enable ssl/tls connection` (if *https* is used)
