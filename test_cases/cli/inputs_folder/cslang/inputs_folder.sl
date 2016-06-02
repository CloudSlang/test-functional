####################################################
#!!
#! @description: Flow with required inputs - default inputs folder case
#!!#
####################################################

namespace: cloudslang

operation:
  name: inputs_folder
  inputs:
    - level_0_0_input_1:
        required: true
    - level_0_0_input_2:
        required: true
    - level_0_1_input_1:
        required: true
    - level_0_1_input_2:
        required: true
#    - level_1_0_input_1:
#        required: true
#    - level_1_0_input_2:
#        required: true
#    - level_1_1_input_1:
#        required: true
#    - level_1_1_input_2:
#        required: true
  python_action:
    script: pass
