## Doel

Het uitrollen van een cursus-image met TDS verwijst naar één van deze scripts waarmee de installatie van benodigde packages wordt geregeld.

## Werkwijze

### Extra software

Update de `.ps1` voor de training [hier](https://github.com/kc/images).

### Update van cache

Kopiëer de `cache.vhdx` terug naar `REPO xxx`. Wellicht de `K:\` eerst even schoonmaken en ontkoppelen.

### Update van chocolatey/boxstarter

Voer `Update-BoxStarter.ps1` uit op een uitgerold image en kopieer `chocolatey.zip` en `BoxStarter.zip` terug naar `REPO xxx`

### Synchronizatie vestigingen

Dit is niet anders dan voorheen. Zelf doe ik dit altijd met [WinMerge](https://chocolatey.org/packages/winmerge).

### Aanpassing installatiescripts

Gebruik op een uitgerold image de shortcut naar `REPO xxx` en dubbelklik de `start` shortcut.
Op de console staat de werkwijze, maar deze komt in het kort hierop neer:

1. Checkout van cursus branch (`git branch -r` voor overzicht van remote branches)
1. Na een push wordt de zip voor die training geüpdate.
1. Bij een update van `master` moet je een `git rebase` doen van alle trainingen, of je gebruikt de `Update-AllBranches` cmdlet van [poshgit](https://chocolatey.org/packages/poshgit)
