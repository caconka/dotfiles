#!/bin/bash

# Documentación para configurar las teclas del teclado (los códigos son los de la tabla e4 Right Ctrl e2 Left Alt)
# https://developer.apple.com/library/archive/technotes/tn2450/_index.html

hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x7000000e3,
      "HIDKeyboardModifierMappingDst":0x7000000e2}]
}'
