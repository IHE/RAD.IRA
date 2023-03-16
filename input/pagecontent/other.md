<div markdown="1" class="stu-note">
This section modifies other IHE profiles or the General Introduction appendices and is not a part of the xxx Profile. The content here will be incorporated into the target narrative at a future time, usually when xxx Profile goes normative.
</div>

## IHE Technical Frameworks General Introduction Appendix A: Actors

|------------------------------------------------|
| Editor, add the following new or modified actors to the [IHE Technical Frameworks General Introduction Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html): |
{:.grid .bg-info}

| Actor                         | Definition                                                                                |
| ----------------------------- | ------------------------------------------------------------------------------------------|
| Hub | The Hub actor is responsible for managing event flows between Subscribers in reporting sessions and maintaining the current context and transaction of content sharing in each session. |
| Worklist Client | The Worklist Client actor is responsible for providing a reporting worklist to the user. |
{:.grid .table-striped}



## IHE Technical Frameworks General Introduction Appendix B: Transactions

|------------------------------------------------|
| Editor, add the following new or modified transactions to the [IHE Technical Frameworks General Introduction Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html): |
{:.grid .bg-info}


| Transaction                    | Definition                                                                              |
| ------------------------------ | --------------------------------------------------------------------------------------- |
| Subscribe to Reporting Session \[RAD-1\] | This transaction is used to subscribe to receive events associated with a reporting session. A reporting session may include reporting on multiple reports, each of which has its own context. |
| Connect to Notification Channel \[RAD-2\] | This transaction is used to connect to a notification channel to receive synchronization events. |
| Open Report Context \[RAD-3\] | This transaction is used to open a report context. Report contexts are opened within an existing reporting session. |
| Close Report Context \[RAD-4\] | This transaction is used to terminate a report context. All synchronizing applications are expected to close their local copy of this context. |
| Update Report Content \[RAD-5\] | This transaction is used to add, change or remove contents in a report context. |
| Select Report Content \[RAD-6\] | This transaction is used to identify specific report contents to other subscribers for potential synchronization. |
| Unsubscribe Session \[RAD-7\] | This transaction is used to unsubscribe from a FHIRcast session. |
| Get Current Context \[RAD-8\] | This transaction is used to retrieve the current context for a given session and all associated contents in that context. |
| Distribute Context Event \[RAD-9\] | This transaction is used to distribute notification events to subscribers. This allows a Subscriber to synchronize to changes in the reporting session initiated by other Subscribers. |
| Generate SyncError Event \[RAD-10\] | This transaction is used to distribute notification events to subscribers about synchronization errors detected by the Manager. |
| Notify Error \[RAD-11\] | This transaction is used to send error notifications when a Subscriber initially accepted an event and later failed to process it. |
{:.grid .table-striped}

## IHE Technical Frameworks General Introduction Appendix D: Glossary

|------------------------------------------------|
| Editor, add the following new or modified terms to the [IHE Technical Frameworks General Introduction Appendix D](https://profiles.ihe.net/GeneralIntro/ch-D.html): |
{:.grid .bg-info}

| Term                         | Definition                                                    | Acronyms/Abbreviations | Synonyms    |
| ---------------------------- | --------------------------------------------------------------| -----------------------| ------------|
| none |  |
{:.grid .table-striped}



