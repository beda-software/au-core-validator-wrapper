FROM markiantorno/validator-wrapper:1.0.68


RUN echo '{"resourceType": "Patient","meta" : {"profile" : ["http://hl7.org.au/fhir/core/StructureDefinition/au-core-patient"]}}' >> patient.json


RUN java -jar validator-wrapper.jar -version 4.0.1 -ig hl7.fhir.au.core#1.0.0-preview -verbose -tx https://tx.dev.hl7.org.au/fhir patient.json || true


CMD ["java", "-server", "-XX:+UnlockExperimentalVMOptions", "-XX:InitialRAMPercentage=79", "-XX:MinRAMPercentage=79", "-XX:MaxRAMPercentage=79", "-XX:+UseG1GC", "-XX:MaxGCPauseMillis=100", "-XX:+UseStringDeduplication", "-XX:+CrashOnOutOfMemoryError", "-jar", "validator-wrapper.jar", "-startServer"]
