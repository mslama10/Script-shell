#!/bin/bash

# Vérifier si GPG est installé
if ! command -v gpg &> /dev/null; then
    echo "GPG n'est pas installé. Veuillez l'installer avant d'exécuter ce script."
    exit 1
fi

# Vérifier le nombre d'arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 fichier_a_chiffrer fichier_destinataire"
    exit 1
fi

fichier_a_chiffrer="$1"
fichier_destinataire="$2"

# Vérifier si le fichier à chiffrer existe
if [ ! -e "$fichier_a_chiffrer" ]; then
    echo "Le fichier à chiffrer '$fichier_a_chiffrer' n'existe pas."
    exit 1
fi

# Chiffrer le fichier avec la clé publique du destinataire
gpg --encrypt --recipient "$fichier_destinataire" --output "$fichier_a_chiffrer.gpg" "$fichier_a_chiffrer"

echo "Le fichier a été chiffré avec succès."
