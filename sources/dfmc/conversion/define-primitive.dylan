Module:   dfmc-conversion
Synopsis: Primitive processing.
Author:   Jonathan Bachrach
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

//// Primitive function modeling.

define compiler-sideways method compute-form-model-object
    (form :: <primitive-definition>, variable-name :: <variable-name-fragment>)
 => (model)
  let signature-spec = form-signature(form);
  let signature = compute-signature(form, signature-spec);
  let primitive
    =  make(<&primitive>,
            signature:       signature,
            signature-spec:  signature-spec,
            getter-name:     as(<symbol>, variable-name),
            side-effecting?: form.form-primitive-side-effecting?,
            stateless?:      form.form-primitive-stateless?,
            dynamic-extent?: form.form-primitive-dynamic-extent?,
            value:           form.form-primitive-value);
  primitive.model-definition := form;
  primitive
end method;
