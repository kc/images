## Doel

Het uitrollen van een cursus-image met TDS verwijst naar één van deze scripts waarmee de installatie van benodigde packages wordt geregeld.

## Werkwijze

### Extra software

Update de `.ps1` voor de training [hier](https://github.com/kc/images).

### Update van cache

Kopiëer de `cache.vhdx` terug naar `REPO xxx`. Wellicht de `K:\` eerst even schoonmaken en ontkoppelen.

### Update van chocolatey/boxstarter

1. Voer `Update-BoxStarter.ps1` uit. De laatste versie van chocolatey wordt opgeslagen in de directory `chocolatey.<versie>`, en de laatste versie van BoxStart in de directory `BoxStarter`. 
2. Vergeet vervolgens niet de wijzigingen te committen en te pushen naar de betreffende branch in utrecht en veenendaal.
3. Als je de upgrade in één keer wil uitvoeren voor alle images, voer de upgrade dan uit op master en rebase alle andere branches vervolgens hierop (let op: rebasen is een gevaarlijke operatie).

### Synchronizatie vestigingen

Dit is niet anders dan voorheen. Zelf doe ik dit altijd met [WinMerge](https://chocolatey.org/packages/winmerge).

### Aanpassing installatiescripts

Gebruik op een uitgerold image de shortcut naar `REPO xxx` en dubbelklik de `start` shortcut.
Op de console staat de werkwijze, maar deze komt in het kort hierop neer:

1. Checkout van cursus branch (`git branch -r` voor overzicht van remote branches)
1. Na een push wordt de zip voor die training geüpdate.
1. Bij een update van `master` moet je een `git rebase` doen van alle trainingen, of je gebruikt de `Update-AllBranches` cmdlet van [poshgit](https://chocolatey.org/packages/poshgit)
