# AU Core Validator Wrapper

**Official wrapper:** 1.0.68

**Official validator:** v6.6.3

Official HL7 validator wrapper with an extra step for cache pre-heating. The target usage is resource validation in the Inferno implementation of test suites for the AU Core. Can be used as a standalone validator wrapper without any restrictions.

**Changes:**
Pre-heating by validating resources with the AU Core IG and TX: https://tx.dev.hl7.org.au/fhir

**Built on top of the:**
1. https://github.com/hapifhir/org.hl7.fhir.validator-wrapper
2. https://hub.docker.com/r/markiantorno/validator-wrapper/

## How to use

### Use image

Compose file example

```yaml
version: '3'
services:
  validator:
    image: ghcr.io/beda-software/validator-wrapper:latest
    restart: always
    ports:
      - 3500:3500
```

### Build and run

```bash
docker compose build
docker compose up
```

The wrapper will be available at http://localhost:3500/
