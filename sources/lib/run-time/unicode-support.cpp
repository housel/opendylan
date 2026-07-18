#define SIMDUTF_NO_LIBCXX 1

#include "simdutf.h"

extern "C" {
#if defined OPEN_DYLAN_BACKEND_LLVM
  #include "llvm-runtime.h"
#elif defined OPEN_DYLAN_BACKEND_C
  #include "run-time.h"
#endif
};

// primitive-utf-8-as-utf-32-size
extern "C" DSINT primitive_utf_8_as_utf_32_size(dylan_value x, DSINT offset, DSINT byte_offset, DSINT size)
{
  auto x_repeated_slot_base = reinterpret_cast<dylan_value *>(x) + offset;
  auto x_input = reinterpret_cast<char *>(x_repeated_slot_base) + byte_offset;
  return simdutf::utf32_length_from_utf8(x_input, size);
}

// primitive-utf-32-as-utf-8-size
extern "C" DSINT primitive_utf_32_as_utf_8_size(dylan_value x, DSINT offset, DSINT codepoint_offset, DSINT size)
{
  auto x_repeated_slot_base = reinterpret_cast<dylan_value *>(x) + offset;
  auto x_input = reinterpret_cast<char32_t *>(x_repeated_slot_base) + codepoint_offset;
  return simdutf::utf8_length_from_utf32(x_input, size);
}

// primitive-validate-utf-8
extern "C" DBOOL primitive_validate_utf_8(dylan_value x, DSINT offset, DSINT byte_offset, DSINT size)
{
  auto x_repeated_slot_base = reinterpret_cast<dylan_value *>(x) + offset;
  auto x_input = reinterpret_cast<char *>(x_repeated_slot_base) + byte_offset;
  return simdutf::validate_utf8(x_input, size);
}

// primitive-transcode-utf-32-as-utf-8
extern "C" DSINT primitive_transcode_utf_32_as_utf_8(dylan_value dst, DSINT dst_base_offset, DSINT dst_offset, dylan_value src, DSINT src_base_offset, DSINT src_offset, DSINT size)
{
  auto dst_repeated_slot_base = reinterpret_cast<dylan_value *>(dst) + dst_base_offset;
  auto dst_output = reinterpret_cast<char *>(dst_repeated_slot_base) + dst_offset;
  auto src_repeated_slot_base = reinterpret_cast<dylan_value *>(src) + src_base_offset;
  auto src_input = reinterpret_cast<char32_t *>(src_repeated_slot_base) + src_offset;
  return simdutf::convert_utf32_to_utf8(src_input, size, dst_output);
}

// primitive-transcode-utf-8-as-utf-32
extern "C" DSINT primitive_transcode_utf_8_as_utf_32(dylan_value dst, DSINT dst_base_offset, DSINT dst_offset, dylan_value src, DSINT src_base_offset, DSINT src_offset, DSINT size)
{
  auto dst_repeated_slot_base = reinterpret_cast<dylan_value *>(dst) + dst_base_offset;
  auto dst_output = reinterpret_cast<char32_t *>(dst_repeated_slot_base) + dst_offset;
  auto src_repeated_slot_base = reinterpret_cast<dylan_value *>(src) + src_base_offset;
  auto src_input = reinterpret_cast<char *>(src_repeated_slot_base) + src_offset;
  return simdutf::convert_utf8_to_utf32(src_input, size, dst_output);
}

#include "simdutf.cpp"
