
> **Warning**: EXPERIMENTAL. **Not ready for production use**.

> **Note**: Highly influcenced by [gatway-api-rs]:https://github.com/kube-rs/gateway-api-rs

# Gateway API Inference Extension (Rust)

This project provides bindings in [Rust] for [Kubernetes] [Gateway API] [Inference Extension].

[gwv]:https://github.com/kubernetes-sigs/gateway-api-inference-extension/releases/tag/v0.3.0
[Rust]:https://rust-lang.org
[Kubernetes]:https://kubernetes.io/
[Gateway API]:https://gateway-api.sigs.k8s.io/
[Gateway API Inference Extension]:https://gateway-api-inference-extension.sigs.k8s.io/

## Usage

[kube-rs]:https://github.com/kube-rs/kube
[Client]:https://docs.rs/kube/latest/kube/struct.Client.html
[Controller]:https://kube.rs/controllers/intro/

## Development

This project uses [Kopium] to automatically generate API bindings from upstream
Gateway API. Make sure you install `kopium` locally in order to run the
generator:

```console
$ cargo install kopium --version 0.21.1
```

After which you can run the `update.sh` script:

```console
$ ./update.sh
```

Check for errors and/or a non-zero exit code, but upon success you should see
updates automatically generated for code in the `gateway-api-inference-extension/src/inference` directory
which you can then commit.

[Kopium]:https://github.com/kube-rs/kopium

## Contributions

Contributions are welcome, and appreciated! In general (for larger changes)
please create an issue describing the contribution needed prior to creating a
PR.
