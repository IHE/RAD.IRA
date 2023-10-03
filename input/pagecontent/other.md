<div markdown="1" class="stu-note">
This section modifies other IHE profiles or the General Introduction appendices and is not a part of the Integrated Reporting Applications (IRA) Profile. The content here will be incorporated into the target narrative at a future time, usually when IRA Profile goes normative.
</div>

## IHE Technical Frameworks General Introduction Appendix A: Actors

|------------------------------------------------|
| Editor, add the following new or modified actors to the [IHE Technical Frameworks General Introduction Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html): |
{:.grid .bg-info}

| Actor                         | Definition                                                                                |
| ----------------------------- | ------------------------------------------------------------------------------------------|
| Hub | Manages event flows between Subscribers in a session and maintains the current context and transaction of content sharing in each session. |
| Worklist Client | Provides a reporting worklist to the user. |
| Stateless Evidence Creator | An Evidence Creator that is not responsible for maintaining its application state when its operations are suspended and resumed. |
{:.grid .table-striped}



## IHE Technical Frameworks General Introduction Appendix B: Transactions

|------------------------------------------------|
| Editor, add the following new or modified transactions to the [IHE Technical Frameworks General Introduction Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html): |
{:.grid .bg-info}


| Transaction                    | Definition                                                                              |
| ------------------------------ | --------------------------------------------------------------------------------------- |
| Subscribe to Reporting Session \[RAD-146\] |  Subscribe to receive events associated with a reporting session. A reporting session may include reporting on multiple reports, each of which has its own context. |
| Connect to Notification Channel \[RAD-147\] | Connect to a notification channel to receive synchronization events. |
| Open Report Context \[RAD-148\] | Open a report context. Report contexts are opened within an existing reporting session. |
| Close Report Context \[RAD-149\] | Terminate a report context. All synchronizing applications are expected to close their local copy of this context. |
| Update Report Content \[RAD-150\] | Add, change or remove contents in a report context. |
| Select Report Content \[RAD-151\] | Identify specific report contents to other subscribers for potential synchronization. |
| Unsubscribe Session \[RAD-152\] | Unsubscribe from a FHIRcast session. |
| Get Current Context \[RAD-153\] | Retrieve the current context for a given session and all associated contents in that context. |
| Distribute Context Event \[RAD-154\] | Distribute notification events to subscribers. This allows a Subscriber to synchronize to changes in the reporting session initiated by other Subscribers. |
| Generate SyncError Event \[RAD-155\] | Distribute notification events to subscribers about synchronization errors detected by the Manager. |
| Notify Error \[RAD-156\] | Send error notifications when a Subscriber initially accepted an event and later failed to process it. |
{:.grid .table-striped}

## IHE Technical Frameworks General Introduction Appendix D: Glossary

|------------------------------------------------|
| Editor, add the following new or modified terms to the [IHE Technical Frameworks General Introduction Appendix D](https://profiles.ihe.net/GeneralIntro/ch-D.html): |
{:.grid .bg-info}

| Term                         | Definition                                                    | Acronyms/Abbreviations | Synonyms    |
| ---------------------------- | --------------------------------------------------------------| -----------------------| ------------|
| none |  |
{:.grid .table-striped}



