# Welcome to the documentation of Geübt-Validate

This is the input validation module of NRW-GEÜBT.

User uploaded metadata and assemblies are checked for conformity in the following steps:

- Metadata are checked to conform to a predefined schemata of obigatory and optionnal metadata.
  As wel as accepted formats and values.
- User provided checksum of the assemblies is compared to a recalculated checksum to ensure
  fasta integrity
- A set of assembly metrics is calculated based on the provided assemblies to
  ensure that the data fulfill the minimal quality requirements

While this module can be used on its own, it is recommended to use the Geübt-core application instead.
