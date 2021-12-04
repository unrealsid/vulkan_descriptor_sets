# vulkan_descriptor_sets
A small vulkan sample showing how to use a single buffer with multiple descriptors. I thought of putting this out since it took me a bit if time to figure out the mechanism to do it properly and I couldn't find any samples that did it with multiple offsets. 

This sample is not production ready at the moment, and is really more to show how to use descriptor offsets with buffers for anyone that is learning Vulkan.

Much of the original code is from vkguide.dev with some of my own changes/refactoring to make the code a bit easier to navigate and read.
The spirv shaders can be found in the shaders folder along with the original shader text code.

A short description of the project and important files: 

The definition of the buffer that will be used is inside vk_frame_data.h. It's called globalFrameDataBuffer inside FrameData. 
A global FrameData variable is then defined in vk_game_engine.h.

The buffer contains data of 3 different structs which are referenced at separate stages of the graphics pipeline. The definition of the structs are provided in vk_global_data.h.

The descriptor initialisation occurs in vk_descriptors_init.cpp. In that, 3 layout bindings are created that use the same base buffer defined in FrameData, but they are initialized at different offsets. The sample currently uses only a Uniform Buffer Pool. The init_descriptors() function then goes on to define the offsets that will be used to read/write the data for the 3 structs that are being used. 

Once all this is done, data is written to the underlying buffer by computing an appropriate offset using the sizes of the struct (check vk_descriptor_write.cpp). This data is then copied over to the gpu.
