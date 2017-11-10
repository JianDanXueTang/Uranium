[shaders]
vertex =
    uniform highp mat4 u_modelViewProjectionMatrix;

    attribute highp vec4 a_vertex;
    attribute lowp vec4 a_color;
    varying lowp vec4 v_color;
    void main()
    {
        gl_Position = u_modelViewProjectionMatrix * a_vertex;
        v_color = a_color;
    }

fragment =
    uniform lowp vec4 u_color;
    varying lowp vec4 v_color;

    void main()
    {
        if(v_color != vec4(0.0, 0.0, 0.0, 1.0))
        {
            gl_FragColor = v_color;
        }
        else
        {
            gl_FragColor = u_color;
        }
    }

[defaults]
u_color = [0.5, 0.5, 0.5, 1.0]

[bindings]
u_modelViewProjectionMatrix = model_view_projection_matrix

[attributes]
a_vertex = vertex
a_color = color
