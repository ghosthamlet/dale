#ifndef DALE_OPERATION_DESTRUCT
#define DALE_OPERATION_DESTRUCT

#include "../../ParseResult/ParseResult.h"
#include "../../Context/Context.h"
#include "../../Type/Type.h"
#include "../../Node/Node.h"

#include "../../llvm_Module.h"
#include "../../llvm_Function.h"
#include "../../llvm_IRBuilder.h"

namespace dale
{
namespace Operation
{
/*! Destruct a parsed value, if required.
 *  @param ctx The current context.
 *  @param pr_value The parse result containing the value to be destroyed.
 *  @param pr The parse result into which the result should be put.
 *  @param builder The current builder (optional).
 *  @param value_is_ptr Whether the value is a pointer (optional).
 */
bool Destruct(Context *ctx, ParseResult *pr_value, ParseResult *pr,
              llvm::IRBuilder<> *builder = NULL,
              bool value_is_ptr = false);
}
}

#endif