"use" @keyword

; Classes TStype TStypeBuildin phpTStype = GruvboxAqua
(scoped_call_expression scope: (name) @phpTStype)
(class_declaration name: (name) @phpTStype)
(base_clause (name) @phpTStype)
(class_constant_access_expression . (name) @phpTStype)
(named_type (name) @phpTStype)
(qualified_name (name) @phpTStype)
(use_declaration (name) @phpTStype)
(object_creation_expression (name) @phpTStype)
(class_interface_clause (name) @phpTStype)
(namespace_aliasing_clause (name) @phpTStype)

(namespace_name_as_prefix) @TSNamespace 

; Visibility = GruvboxYellow
(visibility_modifier) @GruvboxPurple
"public" @GruvboxPurple 
"private" @GruvboxPurple
"protected" @GruvboxPurple

; String
(encapsed_string) @string
