# Scene Assembler
## 3D Scene Loader and Renderer

This application can load, render, and manipulate 3D scenes. A scene consists of 3D models and a scenegraph in which those objects are arranged. Scene files are represented in JSON format, and we use glMatrix for matrix/vector transformations and calculations.

We also implemented camera movement and Phong shading for lighting purposes. Shaders are written in GLSL, with separate shaders for unlit and lit lighting. Some scenes have multiple lighting, and the lit shader supports ambient, directional, and point lights.

In addition, we added the option to add materials and image textures. We used roughness maps to modulate shininess on a per-fragment level and implemented normal mapping to add (fake) depth to the otherwise flat surfaces of the model. Data for materials and textures is provided in source code using OBJs in conjunction with MTLs. The MTL format provides material and texture information which can be pointed to from OBJ.

Author: Divyansh Garg
