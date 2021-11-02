Write down every host record in the current zone as it was shown in the example. 

DNSSEC setting is set to **auto-dnssec**, it means that you don't need to sing zones youreself. Still you may need to generate DS records:

```
**dig dnskey example.net @localhost | dnssec-dsfromkey -f - example.net** 
 ```
Change **example.net** to you domain and save the output, that's going to be sth like:

```
example.net. IN DS 50707 8 1 42727823EB40A1D93F0A1CF22E4AE8768BC40FBA
example.net. IN DS 50707 8 2 BC34B1EA3196C01EEFCC4C571B61753423D264A712E0A4F35847BBDC A5954A5F
```
The DS record is verifiable information (generated from one of the child’s public keys) that a parent zone publishes about its child as part of the chain of trust.
