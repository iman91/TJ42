using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GPLexTutorial.AST
{
    public class LexicalScope
    {
        private LexicalScope parentScope;
        private Dictionary<string, Declaration> symbol_table = new Dictionary<string, Declaration>();

        LexicalScope()
        {
            parentScope = null;
            symbol_table.Clear();
        }

        Declaration ResolveHere(string symbol)
        {
            if (symbol_table.ContainsKey(symbol))
                return symbol_table[symbol];
            else
                return null;
        }

        Declaration Resolve(string symbol)
        {
            Declaration local = ResolveHere(symbol);
            if (local != null)
                return local;
            else if (parentScope != null)
                return parentScope.Resolve(symbol);
            else
                return null;
        }
    };
}
