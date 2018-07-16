# private-bower

Run private-bower in a really odd way, because I have a really really specific
situation where this makes sense.

> YOU SHOULD NOT RUN THIS IN PROD - LOCAL USE ONLY
> SERIOUSLY DO NOT RUN OR PUBLISH IN THE OPEN

Expects that you have a `readonly_key` private key to be able to import into the
container when building (hence don't use this in prod).

## Steps

1. Make a `readonly_key` that you can use with ssh for git ops in the folder.
2. Build the container:
```sh
docker build -t justinribeiro/private-bower .
```
3. Run the container:
```sh
docker run -it -v /work/sourcecode/acc-mirror:/mirror \
           -p 8081:8081 \
           -p 6789:6789 \
           -p 7891:7891 \
           justinribeiro/private-bower
```