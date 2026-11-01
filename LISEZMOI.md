# Boutique avec espace admin — Installation

Fichiers : `index.html` (visiteurs), `admin.html` (vous), `config.js` (réglages), `supabase-setup.sql` (base de données).

## 1. Créer la base de données (gratuit)
1. Créez un compte sur https://supabase.com puis **New project** (choisissez un mot de passe, notez-le).
2. Menu **SQL Editor** → **New query** → collez tout le contenu de `supabase-setup.sql` → **Run**.

## 2. Créer votre compte administrateur
1. Menu **Authentication → Users → Add user → Create new user**.
2. Entrez votre email + un mot de passe solide (cochez *Auto Confirm User*).
3. Menu **Authentication → Sign In / Providers** : désactivez **Allow new users to sign up**
   (important : personne d'autre ne doit pouvoir créer de compte).

## 3. Relier le site
1. Dans Supabase : **Project Settings → API**. Copiez **Project URL** et la clé **anon public**.
2. Ouvrez `config.js` et remplacez `SUPABASE_URL`, `SUPABASE_ANON_KEY`,
   `WHATSAPP_NUMBER` (ex. `221781234567`) et `STORE_NAME`.

## 4. Utiliser
- Visiteurs : `votre-site/index.html` (ils ne peuvent que consulter et commander).
- Admin : `votre-site/admin.html` → connexion → onglets **Produits** et **Catégories**.
  Ajoutez d'abord vos catégories, puis vos produits (nom, prix, tailles, description, photos).

## 5. Mettre en ligne
Déposez le dossier (4 fichiers) sur Netlify, Cloudflare Pages ou Vercel.

## Sécurité
La clé « anon » est faite pour être publique. La protection vient des règles de la base :
les visiteurs peuvent seulement lire, seul le compte admin connecté peut ajouter, modifier ou supprimer.
