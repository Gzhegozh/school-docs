class QuestionnaireSection extends React.Component {
    constructor(props){
        super(props);
    }

    validateAnswer(answer){
        if(answer == '' || !answer)
            return false;

        return true;
    }

    getPercentage(){
        var count = 0;
        Object.keys(this.answers).map((question, index) => {
            if(this.validateAnswer(this.answers[question]))
                count += 1;
            console.log(this.answers[question]);
        });
        return (count / Object.keys(this.answers).length);
    }

    updateAnswer(question, answer){
        this.answers[question] = answer;
        var data = {};
        data.type = 'Questionnaire';
        data.answers = this.answers;
        this.props.updateData(data);
        this.props.updatePercentage(data.type, this.getPercentage());
    }

    componentWillMount(){
        props = this.props;
        if(props.values){
            this.answers = props.values.answers;
        } else {
            this.answers = {};
            this.props.questions.map((question, index) => {
                this.answers[question] = '';
            });
        }
    }

    render(){
        return (
            <div>
                <h3>Please, answer some questions</h3>
                <h4>
                    <small>
                    Your answers help us educate your child
                    </small>
                </h4>
                <hr/>
                {this.props.questions.map((question, index) => {
                    return <Question title={question}
                                     answer={ this.answers[question] }
                                     updateAnswer={ this.updateAnswer.bind(this) }
                                     key={index}
                    />
                })}
            </div>
        );
    }
}