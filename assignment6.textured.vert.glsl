#version 300 es

// an attribute will receive data from a buffer
in vec3 a_position;
in vec3 a_normal;
in vec3 a_tangent;
in vec2 a_texture_coord;

// transformation matrices
uniform mat4x4 u_m;
uniform mat4x4 u_v;
uniform mat4x4 u_p;

// output to fragment stage
// TODO: Create varyings to pass data to the fragment stage (position, texture coords, and more)
out vec3 o_vertex_normal_world;
out vec3 o_vertex_position_world;
out vec2 o_vertex_texture_coords_world;

void main() {

    // transform a vertex from object space directly to screen space
    // the full chain of transformations is:
    // object space -{model}-> world space -{view}-> view space -{projection}-> clip space
    vec4 vertex_position_world = u_m * vec4(a_position, 1.0);

    // TODO: Construct TBN matrix from normals, tangents and bitangents

    vec3 T = normalize(abs(a_tangent.x) > abs(a_tangent.z) ? vec3(-a_tangent.y, a_tangent.x, 0) : vec3(0, -a_tangent.z, a_tangent.y));
    vec3 B = normalize(cross(a_tangent, a_normal));
    vec3 N = a_normal;
    // TODO: Use the Gram-Schmidt process to re-orthogonalize tangents
    // NOTE: Different from the book, try to do all calculations in world space using the TBN to transform normals
    // HINT: Refer to https://learnopengl.com/Advanced-Lighting/Normal-Mapping for all above
    mat3 tbn = mat3(T, B, N);
    vec3 vertex_normal_world = normalize(tbn * a_normal);

    // TODO: Forward data to fragment stage

    gl_Position = u_p * u_v * vertex_position_world;
    o_vertex_position_world = vertex_position_world.xyz;
    o_vertex_normal_world = vertex_normal_world;
}