from IPython.terminal.prompts import Prompts, Token
from prompt_toolkit.formatted_text import fragment_list_width

class MyPrompt(Prompts):

    def in_prompt_tokens(self, cli=None):
        return [
            (Token.Text, self.vi_mode() ),
            (Token.Text, 'Dbg ['),
            (Token.Text, str(self.shell.execution_count)),
            (Token.Text, ']: '),
        ]

    def _width(self):
        return fragment_list_width(self.in_prompt_tokens())

    def continuation_prompt_tokens(self, width=None):
        if width is None:
            width = self._width()
        return [
            (Token.Text, (' ' * (width - 5)) + '...: '),
        ]

    def rewrite_prompt_tokens(self):
        width = self._width()
        return [
            (Token.Text, ('-' * (width - 2)) + '> '),
        ]

    def out_prompt_tokens(self):
        return [
            (Token.Text, 'Out ['),
            (Token.Text, str(self.shell.execution_count)),
            (Token.Text, ']: '),
        ]

c.TerminalInteractiveShell.prompts_class = MyPrompt