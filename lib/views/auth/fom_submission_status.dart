abstract class FormSubmissionStatus{


  const FormSubmissionStatus();



}


class InitialFormStatus extends FormSubmissionStatus{
  const InitialFormStatus();//bu class bekleme durumunu temsil etmektedir.


}
class FormSubmitting extends FormSubmissionStatus{

}
class SubmissionSuccess extends FormSubmissionStatus{

}

class SubmissionFailed extends FormSubmissionStatus{
  final Object exception;
  SubmissionFailed(this.exception);
}


