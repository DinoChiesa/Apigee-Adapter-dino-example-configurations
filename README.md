# Example Configurations for the Apigee Adapter for Envoy

This is a set of YAML files that can be applied to [Envoy Proxy](https://envoyoproxy.io).

I put these together while producing [a video introduction](https://youtu.be/vpvJDMi4JFI) to [the Apigee Adapter for Envoy](https://cloud.google.com/apigee/docs/api-platform/envoy-adapter/v2.0.x/concepts).

## To use

I configured my Envoy proxy to use file-based configuration, pointing to [dynamic-config-1.yaml](./dynamic-config-1.yaml).  That file in turn refers to the files:

* [cds.yaml](./cds.yaml) for the cluster configuration
* [lds.yaml](./lds.yaml) for the listener configuration


And then I had a number of options for CDS and LDS.  I used the [pxds shell
script](./pxds.sh) to copy ONE of the various options into the well-known file
location.

For example, this copies the lds2.yaml file to lds.yaml:

```sh
./pxds.sh lds2.yaml
```

Envoy automatically picks up the new file, after that script copies it in.

The script also works with cds configurations.


## Listener configurations

* [lds1](./lds1.yaml)  
  route all paths to a single cluster with single endpoint

* [lds2](./lds2.yaml)  
  route all paths to multiple different clusters

* [lds3](./lds3.yaml)  
  route all paths to multiple different clusters, with rate limiting

* [lds4](./lds4.yaml)  
  direct response to /hello

* [lds5](./lds5.yaml)  
  route all paths to multiple different clusters with weights, with rate limiting

* [lds-envoy-adapter](./lds-envoy-adapter.yaml)  
  include Apigee Envoy Adapter into the listener

## Cluster configurations

* [cds1](./cds1.yaml)  
  configures two clusters, one Cloud and one ngrok (pointing to a local service). If you
  use ngrok, you will need to modify this file to refer to the URL used by ngrok.

* [cds-envoy-adapter](./cds-envoy-adapter.yaml)  
  configures two additional clusters for use with Apigee: `apigee-remote-service-envoy` and `apigee-auth-service`.
  These allow the Adapter to connect to Apigee.  You will need to modify this file to point to your own
  Apigee instance.

## Disclaimer

This example is not an official Google product, nor is it part of an
official Google product.

## License

This material is [Copyright 2022-2024 Google LLC](./NOTICE).
and is licensed under the [Apache 2.0 License](LICENSE).


## Support

This callout is open-source software, and is not a supported part of Apigee.  If
you need assistance, you can try inquiring on [the Google Cloud Community forum
dedicated to Apigee](https://goo.gle/apigee-community) There is no service-level
guarantee for responses to inquiries posted to that site.
