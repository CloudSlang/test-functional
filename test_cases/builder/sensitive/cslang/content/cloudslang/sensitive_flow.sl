####################################################
#!!
#! @description: Sensitive flow
#!!#
####################################################

namespace: cloudslang

flow:
  name: sensitive_flow
  inputs:
  - password:
      sensitive: true
  workflow:
    - call_op:
        do:
          sensitive_op:
            - password
        publish:
          - password_len
  outputs:
    - password_len
