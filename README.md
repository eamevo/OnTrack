# OnTrack

A healthy habits tracker which encourages users to stick to routines in a fun, interactive way.

## To-do

### Due by 04/15

- [ ] David - Full implementation for AddRoutineView
  - Text field for title
  - Text field for description
  - Fixed selection for frequency (radio, segmented control, dropdown, etc.)
    - Daily, weekly, monthly
  - Generate ID with view model function (invisible to user)
  - Set streak to 0 and days completed array as empty (invisible to user)
- [ ] Rexxwell - Full implementation for SelectedRoutineView
  - Show task title, description, frequency, days completed, current streak
  - Delete button which calls `vm.deleteRoutine` (and then goes to `ContentView`)
  - Back button which goes to `ContentView`
- [ ] Ishika - Full implementation for OnboardingView
  - Text field which allows user to enter their username
  - "Continue" button which calls `setName()` and transitions to `ContentView`
- [ ] Ananya - Full implementation for ContentView
  - List which shows all the user's routines
  - Title and description
  - Frequency (daily, monthly, weekly)
  - Checkmark indicating if task is done (calls `vm.markRoutine`)
  - Info button which goes to `SelectedRoutineView`
- [ ] Enam - Additional functionality for Routine (if needed)
- Full implementation for ViewModel
  - [x] Ishika - `ViewModel.setName()`
  - [x] Enam - `ViewModel.getDailyQuote()`
  - [ ] David - `ViewModel.addRoutine()`
  - [ ] Ananya - `ViewModel.markRoutine()`
  - [ ] Ananya - `ViewModel.routineIsComplete()`
  - [ ] Rexxwell - `ViewModel.deleteRoutine()`
  - [ ] _Unassigned_ - `ViewModel.saveToStorage()`
  - [ ] _Unassigned_ - `ViewModel.loadFromStorage()`

### Due by 04/16

- [ ] Introductory slides
- [ ] Slide for OnboardingView
- [ ] Slide for ContentView
- [ ] Slide for AddRoutineView
- [ ] Slide for SelectedRoutineView
- [ ] Slide for backend architecture (VM and Model)
- [ ] Demo video

## Feature Highlights

- Creation & management of routines
- Categorization (color coding) of routines
- Daily inspirational quotes
- Streaks
- Rewards for sticking to routines (idea still WIP)

## Timeline

 - 03/28 - **DONE!** Finalize app concept & set up project repo
 - 04/02 - **DONE!** Sketches of app views
 - 04/09 - **DONE!** Skeleton code (i.e. create class & method signatures) for all classes/structs
 - 04/15 - Implementation of all classes/structs
 - 04/16 - Presentation slides and demo video
 - 04/18 - **DEMO DAY**

This google doc will no longer be updated. Instead, see what tasks have been assigned to you above and
implement them by making a feature branch _on this repo_.

If you're stuck or unsure what to do, please reach out to me! Also, read through the comments in the 
view model to get an idea of how to approach the function assigned to you.

[Google Docs - Planning document](https://docs.google.com/document/d/10MLJMOxv38Fu246DndurLDr7_QEBVr7DyX2Jv6Vz6rM/edit)
