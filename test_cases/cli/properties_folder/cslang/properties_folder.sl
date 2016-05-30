####################################################
#!!
#! @description: Flow with required inputs - default properties folder case
#!!#
####################################################

namespace: cloudslang

operation:
  name: properties_folder
  inputs:
    - level_0_0_input_1:
        default: ${get_sp('cloudslang.properties.level_0_0_input_1', None)}
        required: true
    - level_0_0_input_2:
        default: ${get_sp('cloudslang.properties.level_0_0_input_2', None)}
        required: true
    - level_0_1_input_1:
        default: ${get_sp('cloudslang.properties.level_0_1_input_1', None)}
        required: true
    - level_0_1_input_2:
        default: ${get_sp('cloudslang.properties.level_0_1_input_2', None)}
        required: true
    - level_1_0_input_1:
        default: ${get_sp('cloudslang.properties.level_1_0_input_1', None)}
        required: true
    - level_1_0_input_2:
        default: ${get_sp('cloudslang.properties.level_1_0_input_2', None)}
        required: true
    - level_1_1_input_1:
        default: ${get_sp('cloudslang.properties.level_1_1_input_1', None)}
        required: true
    - level_1_1_input_2:
        default: ${get_sp('cloudslang.properties.level_1_1_input_2', None)}
        required: true
  python_action:
    script: pass
