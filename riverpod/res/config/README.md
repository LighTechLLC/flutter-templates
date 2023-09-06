
Json creates base on the fields of EnvironmentConfig class with using snake_case format.
This file will be used to create the config instance by decoding the data.
Json files are added to gitignore because of security rules and must not be included in any commit.
To build the project you need to create json file locally and set needed params.
The name of the file is one of the options of EnvironmentType enum according to current build type.

Json example:

{
    "title": "",
}

Exact values for the fields should be figured out from any developers or the team lead.
