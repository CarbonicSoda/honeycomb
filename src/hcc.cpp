#include "HCLexer.h"
#include "HCParser.h"

auto main(int argc, const char *argv[]) -> int {
  std::ifstream src(argv[1]);
  antlr4::ANTLRInputStream input(src);

  parser::HCLexer lexer(&input);
  antlr4::CommonTokenStream tokens(&lexer);

  parser::HCParser parser(&tokens);
  parser::HCParser::ProgramContext *program = parser.program();

  std::cout << '\n' << program->toStringTree(true) << '\n';

  return 0;
}
