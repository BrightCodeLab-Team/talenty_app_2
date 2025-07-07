///
/// [idle] : When data is ready to renders on the UI.
///
/// [busy] : When there is some process(loading data, performing
/// any time taking task) going on and to block new process requests.
///

// ignore_for_file: dangling_library_doc_comments

enum ViewState { idle, busy, loading }
