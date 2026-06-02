#include <string.h>
#include <glib-object.h>

GType g_type_from_instance(GTypeInstance *instance) {
  return G_TYPE_FROM_INSTANCE(instance);
}

GType g_value_type(GValue *gvalue) {
  return G_VALUE_TYPE(gvalue);
}

int sizeof_gvalue() {
  return sizeof(GValue);
}

int sizeof_gclosure() {
  return sizeof(GClosure);
}

void g_value_nullify(GValue *value) {
  memset(value, 0, sizeof(GValue));
}
