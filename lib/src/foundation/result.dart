enum ResultStatus { success, failure }

class Result<Context> {
  ResultStatus status;
  Context context;
  Result(this.status);
}
