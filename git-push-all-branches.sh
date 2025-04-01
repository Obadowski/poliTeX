#!/bin/bash

# Lista todos os branches locais (exceto HEAD)
branches=$(git for-each-ref --format='%(refname:short)' refs/heads/)

# Salva o branch atual
current_branch=$(git branch --show-current)

echo "Fazendo push dos seguintes branches locais para 'origin':"
echo "$branches"
echo

for branch in $branches; do
    echo "-> Branch: $branch"
    git checkout "$branch" >/dev/null 2>&1
    git push -u origin "$branch"
    echo
done

# Volta para o branch original
git checkout "$current_branch" >/dev/null 2>&1
echo "✔️ Push completo. De volta ao branch '$current_branch'"

