####################################################
#!!
#! @description: Sensitive op
#!!#
####################################################

namespace: cloudslang

operation:
  name: sensitive_op
  inputs:
    - password:
        sensitive: true
  python_action:
    script: |
      x = 5 # not used
      new_pass = password[0] + "_generated_by_action" # not used
  outputs:
    - password_len:
        value: ${len(password)} # sensitive by transitivity
        sensitive: false
  results:
    - SUCCESS: ${password != None}
    - FAILURE
