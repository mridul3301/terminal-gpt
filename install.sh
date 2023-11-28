# Simple installer for terminal-gpt in the user's home directory

echo "Hello. Installing terminal-gpt..."
echo "- Creating tgpt in home directory..."
TARGET_DIR=~/terminal-gpt
TARGET_FULLPATH=$TARGET_DIR/tgpt.py
mkdir -p $TARGET_DIR

echo "- Copying files..."
cp tgpt.py prompt.txt tgpt.yaml $TARGET_DIR
chmod +x $TARGET_FULLPATH

# Creates two aliases for use
echo "- Creating tgpt and computer aliases..."
alias tgpt=$TARGET_FULLPATH
alias computer=$TARGET_FULLPATH

# Add the aliases to the logon scripts
# Depends on your shell
if [[ "$SHELL" == "/bin/bash" ]]; then
  echo "- Adding aliases to ~/.bash_aliases"
  [ "$(grep '^alias tgpt=' ~/.bash_aliases)" ]     && echo "alias tgpt already created"     || echo "alias tgpt=$TARGET_FULLPATH"     >> ~/.bash_aliases 
  [ "$(grep '^alias computer=' ~/.bash_aliases)" ] && echo "alias computer already created" || echo "alias computer=$TARGET_FULLPATH" >> ~/.bash_aliases
elif [[ "$SHELL" == "/bin/zsh" ]]; then
  echo "- Adding aliases to ~/.zshrc"
  [ "$(grep '^alias tgpt=' ~/.zshrc)" ]     && echo "alias tgpt already created"     || echo "alias tgpt=$TARGET_FULLPATH"     >> ~/.zshrc 
  [ "$(grep '^alias computer=' ~/.zshrc)" ] && echo "alias computer already created" || echo "alias computer=$TARGET_FULLPATH" >> ~/.zshrc
else
  echo "Note: Shell was not bash or zsh."
  echo "      Consider configuring aliases (like tgpt and/or computer) manually by adding them to your login script, e.g:"
  echo "      alias tgpt=$TARGET_FULLPATH     >> <your_logon_file>"
fi

echo
echo "Done."
echo
echo "Make sure you have the OpenAI API key set via one of these options:" 
echo "  - environment variable"
echo "  - .env or an ~/.openai.apikey file or in"
echo "  - yolo.yaml"
echo
echo "Have fun!"