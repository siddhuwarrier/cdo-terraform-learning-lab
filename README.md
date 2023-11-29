
# Health Warning!

If you are using this lab outside of the context of a guided learning lab at a Cisco Live event, you will probably not find the code to be of much use beyond being a reference. 

And if you're here because you were looking for examples on how to use the CDO Terraform modules, you are probably better off g
- Learning lab: https://developer.cisco.com/learning/labs/secure-firewall-automation-cdo-terraform/cdo-terraform-provider-overview/
- cdo-automation, a repository with complete examples (used in the learning lab above): 

The `terraform` directory contains the code for the Cisco Devnet Terraform lab, first presented at Cisco Live APJC in Melbourne, 2023.

The code itself relies on the presence of an environment (for the Devnet Terraform lab, the environment was deployed in AWS, but it could really be anywhere) that contains the following:
- A public subnet with a Bastion host that is internet accessible over SSH.
- A private subnet with an ASA and an FTD.
- A CDO tenant with:
  - an FMC.
  - an SDC deployed in the private subnet.


