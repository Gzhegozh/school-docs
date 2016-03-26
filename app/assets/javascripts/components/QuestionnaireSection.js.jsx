class QuestionnaireSection extends React.Component {
    constructor(props){
        super(props);
    }

    render(){
        return (
            <div>
                <h3>Please, answer some questions.</h3>
                <br/>
                <Question/>
                <br/>
            </div>
        );
    }
}