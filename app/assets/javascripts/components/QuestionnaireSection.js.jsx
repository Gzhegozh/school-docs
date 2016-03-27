class QuestionnaireSection extends React.Component {
    constructor(props){
        super(props);
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
                <Question/>
                <br/>
            </div>
        );
    }
}